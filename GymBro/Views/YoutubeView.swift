//
//  YoutubeView.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import SwiftUI

struct YoutubeView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geo in
            WebView("https://youtu.be/Rzi2Q9bOQNQ")
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView()
    }
}
