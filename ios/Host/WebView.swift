//
//  WebView.swift
//  Host
//
//  Created by Maximilian Alexander on 7/25/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
