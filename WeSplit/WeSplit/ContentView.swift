//
//  ContentView.swift
//  WeSplit
//
//  Created by John Anthony Heaney on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
        }
        .navigationTitle("SwiftUI")
    }
}

#Preview {
    ContentView()
}
