//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by John Anthony Heaney on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

#Preview {
    ContentView()
}
