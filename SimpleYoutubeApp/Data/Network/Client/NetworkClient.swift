//
//  NetworkClient.swift
//  SimpleYoutubeApp
//
//  Created by Fabi Diartt on 2/04/21.
//  Copyright © 2021 Fabi Diartt. All rights reserved.
//

import Foundation

class NetworkClient {
    
    func getURL<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let err = error {
                completion(Result.failure(err))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            guard let _data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            // print(NSString(data: _data, encoding: String.Encoding.utf8.rawValue) ?? "NIL DATA")
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                if (httpResponse.statusCode == 200) {
                    let decodedData = try decoder.decode(T.self, from: _data)
                    completion(.success(decodedData))
                } else {
                    let decodedError = try decoder.decode(YoutubeAPIError.self, from: _data)
                    completion(.failure(decodedError))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
