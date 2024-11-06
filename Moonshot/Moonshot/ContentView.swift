//
//  ContentView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 06/11/2024.
//

import SwiftUI



struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
