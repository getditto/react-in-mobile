//
//  HostApp.swift
//  Host
//
//  Created by Maximilian Alexander on 7/25/23.
//

import SwiftUI
import GCDWebServer

@main
struct HostApp: App {
    
    let webServer = GCDWebServer()
    
    init() {
        if let path = Bundle.main.resourcePath?.appending("/dist") {
            webServer.addGETHandler(forBasePath: "/", directoryPath: path, indexFilename: "index.html", cacheAge: 0, allowRangeRequests: true)
            webServer.start(withPort: 8080, bonjourName: nil)
            if let url = webServer.serverURL {
                print("Visit \(url) in your web browser")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
