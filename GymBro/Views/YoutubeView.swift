//
//  YoutubeView.swift
//  GymBro
//
//  Created by sano on 7/26/22.
//

import SwiftUI

struct YoutubeView: View {
    @Environment(\.dismiss) private var dismiss
    var id: String
    
    var body: some View {
        GeometryReader { geo in
            WebView("https://youtu.be/\(id)")
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
