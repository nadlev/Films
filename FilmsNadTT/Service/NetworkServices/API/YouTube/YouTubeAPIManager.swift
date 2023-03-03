//
//  YouTubeAPIManager.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/3/23.
//

import Foundation

fileprivate enum YouTubeAPIBase: String {
    case scheme = "https"
    case host = "youtube.googleapis.com"
}

fileprivate enum YouTubeAPIType {
    case video
    
    var path: String {
        switch self {
        case .video:
            return "/youtube/v3/search"
        }
    }
}

class YouTubeApiManager {
    
    private let apiKey: String
    private let networkService = NetworkService()
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func searchVideo(query: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = networkService.createURL(scheme: YouTubeAPIBase.scheme.rawValue,
                                                 host: YouTubeAPIBase.host.rawValue,
                                                 path: YouTubeAPIType.video.path,
                                                 queryParameters: prepareQueryParameters(query: query, key: apiKey))
        else { return }
        
        let task = networkService.createTask(with: url, completion: completion)
        task.resume()
    }
    
    private func prepareQueryParameters(query: String, key: String) -> [String: String] {
        var parameters: [String: String] = [:]
        parameters["q"] = query
        parameters["key"] = key
        return parameters
    }
}
