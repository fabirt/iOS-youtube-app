//
//  YoutubeServiceImpl.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

class YoutubeServiceImpl : YoutubeService {
    /// Singleton instance.
    static let shared = YoutubeServiceImpl()
    private init() { }
    
    private let client = NetworkClient()
    
    func searchContent(
        query: String,
        completion: @escaping (Result<VideoSearchResult, Error>) -> Void) throws {
        let queryItems = [
            URLQueryItem(name: "key", value: try Configuration.value(for: "YouTubeApiKey")),
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "q", value: query)
        ]
        var urlComponents = URLComponents(string: API.searchContent)!
        urlComponents.queryItems = queryItems
        client.getURL(url: urlComponents.url!, completion: completion)
    }
}
