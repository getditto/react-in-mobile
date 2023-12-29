//
//  WebView.swift
//  Host
//
//  Created by Maximilian Alexander on 7/25/23.
//

import SwiftUI
import WebKit

/**
 * There isn't a SwiftUI equivalent of `WKWebView`
 * This is a wrapper user to configure and read the local dist/index.html file
 */
struct WebView: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        // configuring the `WKWebView` is very important
        // without doing this the local index.html will not be able to read
        // the css or js files properly
        let config = WKWebViewConfiguration()
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        config.setValue(true, forKey: "allowUniversalAccessFromFileURLs")
        // set the configuration on the `WKWebView`
        // don't worry about the frame: .zero, SwiftUI will resize the `WKWebView` to
        // fit the parent
        let webView = WKWebView(frame: .zero, configuration: config)
        // now load the local url
        webView.loadFileURL(url, allowingReadAccessTo: url)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadFileURL(url, allowingReadAccessTo: url)
    }
}
