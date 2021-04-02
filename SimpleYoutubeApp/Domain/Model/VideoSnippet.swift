//
//  VideoSnippet.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

// MARK: - VideoSnippet
struct VideoSnippet: Codable {
    let kind, etag: String
    let id: VideoID
    let snippet: Snippet
}

// MARK: - VideoID
struct VideoID: Codable {
    let kind: String
    let videoID: String?
    let playlistID: String?
    
    // Specify coding/decoding keys
    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
        case playlistID = "playlistId"
    }
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date
    let channelID, title, description: String
    let thumbnails: Thumbnails
    let channelTitle, liveBroadcastContent: String
    let publishTime: Date

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let defaultThumbnail, medium, high: Thumbnail

    enum CodingKeys: String, CodingKey {
        case defaultThumbnail = "default"
        case medium, high
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let url: String
    let width, height: Int
}
