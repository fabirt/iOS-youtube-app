//
//  YoutubeControlState.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 3/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

enum playerCommandToExecute {
    case loadNewVideo
    case play
    case pause
    case forward
    case backward
    case stop
    case idle
}

class YouTubeControlState: ObservableObject {
  
    @Published var videoID: String? // = "qRC4Vk6kisY"
    {
        didSet {
            self.executeCommand = .loadNewVideo
        }
    }
  
    @Published var videoState: playerCommandToExecute = .loadNewVideo
    
    @Published var executeCommand: playerCommandToExecute = .idle
    
    func playPauseButtonTapped() {
        if videoState == .play {
            pauseVideo()
        } else if videoState == .pause {
            playVideo()
        } else {
            print("Unknown player state, attempting playing")
            playVideo()
        }
    }
    
    func playVideo() {
        executeCommand = .play
    }
    
    func pauseVideo() {
        executeCommand = .pause
    }
    
    func forward() {
        executeCommand = .forward
    }
    
    func backward() {
        executeCommand = .backward
    }
}
