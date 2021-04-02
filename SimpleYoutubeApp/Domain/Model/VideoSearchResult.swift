//
//  VideoSearchResult.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

struct VideoSearchResult: Codable {
    let kind, etag, regionCode: String
    let items: [VideoSnippet]
}
