//
//  ContentView.swift
//  WordScramble
//
//  Created by John Anthony Heaney on 18/10/2024.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Text("Static Row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
        }
    }
}

#Preview {
    ContentView()
}
