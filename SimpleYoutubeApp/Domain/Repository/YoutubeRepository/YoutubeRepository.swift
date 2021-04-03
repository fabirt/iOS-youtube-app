//
//  YoutubeRepository.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

protocol YoutubeRepository {
    
    func searchContent(
        query: String,
        pageToken: String?,
        completion: @escaping (Result<VideoSearchResult, Error>) -> Void
    )
}
