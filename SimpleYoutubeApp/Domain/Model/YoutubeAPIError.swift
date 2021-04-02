//
//  YoutubeAPIError.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

// MARK: - YoutubeAPIError
struct YoutubeAPIError: Codable {
    let error: YoutubeAPIErrorContent
}

// MARK: - YoutubeAPIErrorContent
struct YoutubeAPIErrorContent: Codable {
    let code: Int
    let message: String
    let errors: [ErrorElement]
    let status: String
}

// MARK: - ErrorElement
struct ErrorElement: Codable {
    let message, domain, reason: String
}
