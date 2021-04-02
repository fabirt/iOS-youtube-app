//
//  SearchView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            TextField(
                "Search",
                text: $viewModel.searchText,
                onCommit: self.viewModel.searchContent
            ).keyboardType(.webSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List {
                ForEach(viewModel.items, id: \.etag) { (video: VideoSnippet) in
                    VideoSnippetView(video: video)
                        .padding(.bottom)
                        .listRowInsets(.init())
                }
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
