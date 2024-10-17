//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by John Anthony Heaney on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.green)
            .padding()
            .background(.red)
            .padding()
            .background(.green)
    }
}

#Preview {
    ContentView()
}
