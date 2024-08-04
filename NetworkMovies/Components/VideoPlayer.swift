//
//  VideoPlayer.swift
//  Movie2
//
//  Created by Ahmed Rady on 28/07/2024.
//

import Foundation
import SwiftUI
import AVKit
import WebKit

struct YouTubeView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
