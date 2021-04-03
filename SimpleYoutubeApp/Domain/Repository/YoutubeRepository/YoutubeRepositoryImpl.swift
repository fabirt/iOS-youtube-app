//
//  YoutubeRepositoryImpl.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

struct YoutubeRepositoryImpl: YoutubeRepository {
    
    let service: YoutubeService
    
    func searchContent(
        query: String,
        pageToken: String?,
        completion: @escaping (Result<VideoSearchResult, Error>) -> Void
    ) {
        do {
            try service.searchContent(query: query, pageToken: pageToken) { result in
                completion(result)
            }
        } catch {
            completion(.failure(error))
        }
    }
}
