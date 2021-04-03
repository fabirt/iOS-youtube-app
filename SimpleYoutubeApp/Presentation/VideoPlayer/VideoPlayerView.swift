//
//  VideoPlayerView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 3/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation
import SwiftUI

struct VideoPlayerView: View {
    let video: VideoSnippet
    @EnvironmentObject var playerState: YouTubeControlState
    
    var body: some View {
        YouTubeView(playerState: playerState)
            .onAppear {
                self.playerState.videoID = self.video.id.videoID
        }
    }
}
