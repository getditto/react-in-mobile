//
//  ContentView.swift
//  Host
//
//  Created by Maximilian Alexander on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        WebView(url: URL(string: "http://localhost:8080/index.html")!)
            .onAppear {
                listAllFiles()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 * This is just a helper function 
 */
func listAllFiles() {
    let url = Bundle.main.bundleURL
    var files = [URL]()
    if let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
        for case let fileURL as URL in enumerator {
            do {
                let fileAttributes = try fileURL.resourceValues(forKeys:[.isRegularFileKey])
                if fileAttributes.isRegularFile! {
                    files.append(fileURL)
                }
            } catch { print(error, fileURL) }
        }
        print(files)
    }
}
