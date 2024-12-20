//
//  ContentView.swift
//  Navigation
//
//  Created by John Anthony Heaney on 12/11/2024.
//

import SwiftUI


struct ContentView: View {
   @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
