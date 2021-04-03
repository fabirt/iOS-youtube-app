//
//  SearchViewModel.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var state: SearchViewState = .loading
    @Published var isLoadingPage: Bool = false
    var searchText: String = ""
    private let repository: YoutubeRepository = YoutubeRepositoryImpl(service: YoutubeServiceTestImpl.shared)
    private var nextPageToken: String? = nil
    
    init() {
        initializeContent()
    }
    
    func searchContent() {
        searchContent(query: searchText.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    func initializeContent() {
        searchContent(query: "")
    }
    
    func loadMoreContentIfNeeded(currentItem item: VideoSnippet) {
        guard case SearchViewState.success(let items) = state else {
            return
        }
        
        let thresholdIndex = items.index(items.endIndex, offsetBy: -2)
        let itemIndex = items.firstIndex(where: { $0.id.videoID == item.id.videoID } )
        
        if itemIndex != thresholdIndex {
            return
        }
        
        
        guard !isLoadingPage, let _nextPageToken = nextPageToken else {
            return
        }
        
        isLoadingPage = true
        
        print("Loading more content")
        
        repository.searchContent(query: searchText, pageToken: _nextPageToken) { result in
            DispatchQueue.main.async {
                if case SearchViewState.success(let currentVideos) = self.state {
                    if case Result.success(let successResult) = result {
                        self.nextPageToken = successResult.nextPageToken
                        let videos = currentVideos + successResult.items
                        self.state = .success(videos)
                    } else {
                        self.nextPageToken = nil
                    }
                }
                
                self.isLoadingPage = false
            }
        }
        
    }
    
    private func searchContent(query: String) {
        state = .loading
        repository.searchContent(query: query, pageToken: nil) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResult):
                    self.nextPageToken = searchResult.nextPageToken
                    self.state = .success(searchResult.items)
                    
                case .failure(let error):
                    self.state = .error(error)
                }
            }
        }
    }
}

enum SearchViewState {
    case loading
    case error(Error)
    case success([VideoSnippet])
}
