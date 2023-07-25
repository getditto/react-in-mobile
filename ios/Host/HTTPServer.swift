//
//  HTTPServer.swift
//  Host
//
//  Created by Maximilian Alexander on 7/25/23.
//

import Foundation
import GCDWebServer

class HTTPServerManager: ObservableObject {
    
    var webServer: GCDWebServer
    
    init() {
        webServer = GCDWebServer()
        if let path = Bundle.main.resourcePath?.appending("/dist") {
            webServer.addGETHandler(forBasePath: "/", directoryPath: path, indexFilename: "index.html", cacheAge: 3600, allowRangeRequests: true)
            webServer.start(withPort: 8080, bonjourName: nil)
            print("Visit \(webServer.serverURL) in your web browser")
        }
    }
    
}
