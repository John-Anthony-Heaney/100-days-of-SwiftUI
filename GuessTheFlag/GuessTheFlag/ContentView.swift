//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by John Anthony Heaney on 16/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Import message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
    }
    
    
   
}

#Preview {
    ContentView()
}
