//
//  ContentView.swift
//  iExpense
//
//  Created by John Anthony Heaney on 23/10/2024.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("TapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
