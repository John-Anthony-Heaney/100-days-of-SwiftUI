//
//  ContentView.swift
//  Navigation
//
//  Created by John Anthony Heaney on 12/11/2024.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: 556)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
