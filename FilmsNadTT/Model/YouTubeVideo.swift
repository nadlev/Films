//
//  YouTubeVideo.swift
//  FilmsNadTT
//
//  Created by Надежда Левицкая on 1/30/23.
//

import Foundation

struct YouTubeVideo: Decodable {
    let etag: String?
    let items: [VideoComponents]?
}

struct VideoComponents: Decodable {
    let etag: String?
    let id: VideoIDComponents?
    let kind: String?
}

struct VideoIDComponents: Decodable {
    let kind: String?
    let videoId: String?
}
