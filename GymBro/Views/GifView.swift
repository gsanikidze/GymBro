//
//  GifView.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI
import WebKit

struct GifView: UIViewRepresentable {
    let request = URLRequest(url: URL(string: "https://d205bpvrqc9yn1.cloudfront.net/0001.gif")!)
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct GifView_Previews: PreviewProvider {
    static var previews: some View {
        GifView()
            .previewLayout(.sizeThatFits)
    }
}
