//
//  APIConstant.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

struct API {
    
    private init() {}
    
    private static let baseUrl = "https://www.googleapis.com/youtube/v3/"
    
    static let searchContent = "\(baseUrl)search"
}
