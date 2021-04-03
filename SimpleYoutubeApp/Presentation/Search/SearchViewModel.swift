//
//  SearchViewModel.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    var searchText: String = ""
    private let repository: YoutubeRepository = YoutubeRepositoryImpl(service: YoutubeServiceTestImpl.shared)
    @Published var state: SearchViewState = .loading
    
    func searchContent() {
        searchContent(query: searchText.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    func initializeContent() {
        searchContent(query: "")
    }
    
    private func searchContent(query: String) {
        state = .loading
        repository.searchContent(query: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResult):
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
