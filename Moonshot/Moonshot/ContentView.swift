//
//  ContentView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 06/11/2024.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            //GridLayout(astronauts: astronauts, missions: missions)
            ListLayout(astronauts: astronauts, missions: missions)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
