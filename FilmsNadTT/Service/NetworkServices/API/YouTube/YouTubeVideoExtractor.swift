//
//  YouTubeVideoExtractor.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 3/3/23.
//

import Foundation

fileprivate enum YouTubeVideoURLBase: String {
    case scheme = "https"
    case host = "www.youtube.com"
}

fileprivate enum YouTubeVideoInfoType {
    case video(id: String)
    
    var path: String {
        switch self {
        case .video(let id):
            return "/embed/\(id)"
        }
    }
}

class YouTubeVideoExtractor {
    private let networkService = NetworkService()
    
    func fetchVideo(id: String, completion: @escaping (URL) -> Void) {
        guard let url = networkService.createURL(
            scheme: YouTubeVideoURLBase.scheme.rawValue,
            host: YouTubeVideoURLBase.host.rawValue,
            path: YouTubeVideoInfoType.video(id: id).path,
            queryParameters: nil) else { return }
        completion(url)
    }
}
