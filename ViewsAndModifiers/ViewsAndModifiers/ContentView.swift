//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by John Anthony Heaney on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ContentView()
}
