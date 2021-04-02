//
//  YoutubeService.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

protocol YoutubeService {
    
    func searchContent(
        query: String,
        completion: @escaping (Result<VideoSnippet, Error>) -> Void
    ) throws
}
