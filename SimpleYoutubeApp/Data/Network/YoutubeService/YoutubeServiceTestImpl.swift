//
//  YoutubeServiceTestImpl.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

class YoutubeServiceTestImpl: YoutubeService {
    /// Singleton instance.
    static let shared = YoutubeServiceTestImpl()
    private init() { }
    
    func searchContent(
        query: String,
        pageToken: String?,
        completion: @escaping (Result<VideoSearchResult, Error>) -> Void
    ) throws {
        let items = [
            demoVideoSnippet()
        ]
        let result = VideoSearchResult(
            kind: "youtube#searchListResponse",
            etag: "f7p4L4ZmLBZx8MgoogLuHUYNs2w",
            regionCode: "CO",
            nextPageToken: nil,
            items: items
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success(result))
        }
    }
}

func demoVideoSnippet() -> VideoSnippet {
    let dateFormatter = ISO8601DateFormatter()
    return VideoSnippet(
        kind: "youtube#searchResult",
        etag: "D3Bc931p36RzWqx4SW8SPOxuCWc",
        id: VideoID(kind: "youtube#video", videoID: "TVUNi0zi1yw"),
        snippet: Snippet(
            publishedAt: dateFormatter.date(from: "2020-12-12T05:53:55Z")!,
            channelID: "UCmFIRWTzoCvM7l0aw5S_4Ww",
            title: "KPOP BEST SONGS 2020 [read description]",
            description: "subscribe to my channel for more kpop playlist -comment anything below. turn on the post notifications. -thank you for watching. i hope you'll enjoy this one",
            thumbnails: Thumbnails(
                defaultThumbnail: Thumbnail(url: "https://i.ytimg.com/vi/TVUNi0zi1yw/default.jpg", width: 120, height: 90),
                medium: Thumbnail(url: "https://i.ytimg.com/vi/TVUNi0zi1yw/mqdefault.jpg", width: 320, height: 180),
                high: Thumbnail(url: "https://i.ytimg.com/vi/TVUNi0zi1yw/hqdefault.jpg", width: 480, height: 360)),
            channelTitle: "taekooi",
            liveBroadcastContent: "none",
            publishTime: dateFormatter.date(from: "2020-12-12T05:53:55Z")!)
    )
}
