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
    @EnvironmentObject var playerState: YouTubeControlState
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Search",
                    text: $viewModel.searchText,
                    onCommit: self.viewModel.searchContent
                ).keyboardType(.webSearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .padding()
                
                buildContent()
            }.navigationBarTitle("Simple YT")
                .environmentObject(viewModel)
        }
    }
    
    private func buildContent() -> AnyView {
        switch self.viewModel.state {
        case .loading:
            return AnyView(LoadingView().frame(maxHeight: .infinity))
        case .error(let error):
            return AnyView(
                ErrorView(
                    error: error,
                    onRetry: self.retrySearch
                ).frame(maxHeight: .infinity))
        case .success(let videos):
            return AnyView(
                VideoListView(videos: videos) { video in
                    self.playerState.videoID = video.id.videoID
                    self.playerState.playVideo()
                }
            )
        }
    }
    
    func retrySearch() {
        if (viewModel.searchText.isEmpty) {
            viewModel.initializeContent()
        } else {
            viewModel.searchContent()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
