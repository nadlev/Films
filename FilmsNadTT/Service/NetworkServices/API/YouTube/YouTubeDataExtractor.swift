//
//  YouTubeDataExtractor.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/3/23.
//

import Foundation

class YouTubeDataExtractor {
    
    private let apiManager: YouTubeApiManager
    
    init(apiKey: String) {
        apiManager = YouTubeApiManager(apiKey: apiKey)
    }
    
    func searchVideo(query: String, completion: @escaping(VideoComponents?) -> Void) {
        apiManager.searchVideo(query: query) { data, error in
            guard let strongData = data, error == nil else {
                completion(nil)
                print(error!.localizedDescription)
                return
            }
            
            let youTubeResults = self.decodeJSON(type: YouTubeVideo.self, from: strongData)
            completion(youTubeResults?.items?.first)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        guard let data = data else { return nil }
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch let decodeError {
            print(decodeError)
            return nil
        }
    }
}
