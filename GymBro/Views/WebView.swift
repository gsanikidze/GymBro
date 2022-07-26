//
//  GifView.swift
//  GymBro
//
//  Created by sano on 7/19/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var request: URLRequest
    
    init(_ url: String) {
        request = URLRequest(url: URL(string: url.replacingOccurrences(of: "http://", with: "https://"))!)
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
