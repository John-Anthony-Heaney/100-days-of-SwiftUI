//
//  ContentView.swift
//  WeSplit
//
//  Created by John Anthony Heaney on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
