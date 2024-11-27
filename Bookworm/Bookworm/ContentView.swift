//
//  ContentView.swift
//  Bookworm
//
//  Created by John Anthony Heaney on 27/11/2024.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text",text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
