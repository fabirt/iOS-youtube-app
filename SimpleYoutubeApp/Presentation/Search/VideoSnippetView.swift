//
//  VideoSnippetView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoSnippetView: View {
    let video: VideoSnippet
    let onTapGesture: () -> Void
    
    var body: some View {
        // let dateFormatter = DateFormatter()
        // dateFormatter.dateFormat = "MMM dd, yyyy"
        // let date = dateFormatter.string(from: video.snippet.publishedAt)
        
        NavigationLink(destination: VideoPlayerView(video: video)) {
            VStack(alignment: .leading, spacing: 0) {
                WebImage(url: URL(string: video.snippet.thumbnails.medium.url))
                    .resizable()
                    .placeholder(Image("ThumbnailPlaceholder"))
                    .scaledToFill()
                    .aspectRatio(320 / 180, contentMode: .fit)
                VStack(alignment: .leading, spacing: 2) {
                    Text(video.snippet.title)
                    Text(video.snippet.channelTitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(video.snippet.publishedAt.timeAgo())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.padding(.horizontal)
                    .padding(.vertical)
            }
            .contentShape(Rectangle())
        }
    }
}

struct VideoSnippetView_Previews: PreviewProvider {
    static var previews: some View {
        VideoSnippetView(video: demoVideoSnippet()) {
            
        }
    }
}
