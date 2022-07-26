//
//  YoutubeVideoModel.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import Foundation

struct YoutubeVideoId: Decodable {
    let videoId: String
}

struct YoutubeVideoThumnail: Decodable {
    let url: String
    let width: Double
    let height: Double
}

struct YoutubeVideoThumnails: Decodable {
    let medium: YoutubeVideoThumnail
}

struct YoutubeVideoSnippet: Decodable {
    let title: String
    let channelTitle: String
    let thumbnails: YoutubeVideoThumnails
}

struct YoutubeVideo: Decodable {
    let id: YoutubeVideoId
    let snippet: YoutubeVideoSnippet
}

struct YoutubeResult: Decodable {
    let items: [YoutubeVideo]
}
