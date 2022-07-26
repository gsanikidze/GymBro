//
//  YoutubeVideoCardView.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import SwiftUI

struct YoutubeVideoCardView: View {
    private let bounds = UIScreen.main.bounds
    
    var body: some View {
        VStack (alignment: .leading) {
            NavigationLink(destination: YoutubeView()) {
                ZStack {
                    WebView("https://i.ytimg.com/vi/MLfXovxCx6M/mqdefault.jpg")
                        .frame(width: 320, height: 180)
                        .cornerRadius(10)
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
            }
            Text("How To Do Decline Close Grip Bench to Skull Crusher | Exercise Demo")
                .font(.headline)
                .padding(.bottom, 2)
                .padding(.top, 5)
            Text("Origym Personal Trainer Courses")
                .font(.caption)
        }
        .frame(width: 320)
    }
}

struct YoutubeVideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoCardView()
            .previewLayout(.sizeThatFits)
    }
}
