//
//  ContentView.swift
//  WordScramble
//
//  Created by John Anthony Heaney on 18/10/2024.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
      Text("Hello world")
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
