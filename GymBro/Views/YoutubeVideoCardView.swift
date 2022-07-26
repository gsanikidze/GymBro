//
//  YoutubeVideoCardView.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import SwiftUI

struct YoutubeVideoCardView: View {
    let video: YoutubeVideo
    private let bounds = UIScreen.main.bounds
    
    var body: some View {
        VStack (alignment: .leading) {
            NavigationLink(destination: YoutubeView(id: video.id.videoId)) {
                ZStack {
                    WebView(video.snippet.thumbnails.medium.url)
                        .frame(width: 320, height: 180)
                        .cornerRadius(10)
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
            }
            Text(video.snippet.title)
                .font(.headline)
                .padding(.bottom, 2)
                .padding(.top, 5)
            Text(video.snippet.channelTitle)
                .font(.caption)
        }
        .frame(width: 320)
    }
}
