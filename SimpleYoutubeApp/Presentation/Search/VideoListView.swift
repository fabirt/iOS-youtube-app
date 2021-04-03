//
//  VideoListView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI

struct VideoListView: View {
    let videos: [VideoSnippet]
    let onVideoTap: (VideoSnippet) -> Void
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        List {
            ForEach(videos, id: \.etag) { (video: VideoSnippet) in
                VideoSnippetView(video: video) {
                    self.onVideoTap(video)
                }.listRowInsets(.init())
                    .onAppear {
                        self.viewModel.loadMoreContentIfNeeded(currentItem: video)
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView(videos: []) { _ in }
            .environmentObject(SearchViewModel())
    }
}
