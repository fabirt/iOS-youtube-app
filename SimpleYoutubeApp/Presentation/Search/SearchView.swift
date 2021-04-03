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
            
            renderContent()
        }.onAppear {
            self.viewModel.initializeContent()
        }
    }
    
    func renderContent() -> AnyView {
        switch self.viewModel.state {
        case .loading:
            return AnyView(Text("Loading").frame(maxHeight: .infinity))
        case .error(let error):
            return AnyView(Text(error.localizedDescription).frame(maxHeight: .infinity))
        case .success(let videos):
            return AnyView(List {
                ForEach(videos, id: \.etag) { (video: VideoSnippet) in
                    VideoSnippetView(video: video)
                        .listRowInsets(.init())
                }
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
