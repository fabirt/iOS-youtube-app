//
//  YouTubeView.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 3/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import YouTubePlayer

struct YouTubeView: UIViewRepresentable {
    
    typealias UIViewType = YouTubePlayerView
    
    @ObservedObject var playerState: YouTubeControlState
  
    init(playerState: YouTubeControlState) {
        self.playerState = playerState
    }
        
    func makeUIView(context: Context) -> UIViewType {
        let ytVideo = YouTubePlayerView()
        
        let playerVars = [
            "controls": "1",
            "playsinline": "0",
            "autohide": "0",
            "autoplay": "0",
            "fs": "1",
            "rel": "0",
            "loop": "0",
            "enablejsapi": "1",
            "modestbranding": "1",
            "origin": "https://www.youtube.com"
        ]
        
        ytVideo.playerVars = playerVars as YouTubePlayerView.YouTubePlayerParameters
        ytVideo.delegate = context.coordinator
        
        return ytVideo
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        guard let videoID = playerState.videoID else { return }
        print("update YouTubeView")
        print(playerState.executeCommand)
        print(uiView.ready)

        if !(playerState.executeCommand == .idle) && uiView.ready {

            switch playerState.executeCommand {
            case .loadNewVideo:
                playerState.executeCommand = .idle
                uiView.loadVideoID(videoID)
            case .play:
                playerState.executeCommand = .idle
                uiView.play()
            case .pause:
                playerState.executeCommand = .idle
                uiView.pause()
            case .forward:
                playerState.executeCommand = .idle
                uiView.getCurrentTime { (time) in
                    guard let time = time else {return}
                    uiView.seekTo(Float(time) + 10, seekAhead: true)
                }
            case .backward:
                playerState.executeCommand = .idle
                uiView.getCurrentTime { (time) in
                    guard let time = time else {return}
                    uiView.seekTo(Float(time) - 10, seekAhead: true)
                }
            default:
                playerState.executeCommand = .idle
                print("\(playerState.executeCommand) not yet implemented")
            }
        } else if !uiView.ready {
            uiView.loadVideoID(videoID)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(playerState: playerState)
    }
    
    class Coordinator: YouTubePlayerDelegate {
        @ObservedObject var playerState: YouTubeControlState
        
        init(playerState: YouTubeControlState) {
            print("Coordinator init")
            self.playerState = playerState
        }
        
        func playerReady(videoPlayer: YouTubePlayerView) {
            print("playerReady")
            videoPlayer.play()
            playerState.videoState = .play
        }
        
        func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
            
            switch playerState {
            case .Playing:
                self.playerState.videoState = .play
            case .Paused, .Buffering, .Unstarted:
                self.playerState.videoState = .pause
            case .Ended:
                self.playerState.videoState = .stop
                // self.playerState.videoID = loadNextVideo()
            default:
                print("\(playerState) not implemented")
            }
        }
    }
}
