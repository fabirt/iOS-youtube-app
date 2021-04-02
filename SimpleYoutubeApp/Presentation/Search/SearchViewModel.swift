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
    @Published var items: [VideoSnippet] = []
    
    func searchContent() {
        if (searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return
        }
        repository.searchContent(query: searchText) { result in
            print(result)
            switch result {
            case .success(let searchResult):
                self.items = searchResult.items
                break
                
            case .failure(_):
                break
            }
        }
    }
}
