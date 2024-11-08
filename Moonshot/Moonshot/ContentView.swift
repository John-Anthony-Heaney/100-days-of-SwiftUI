//
//  ContentView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 06/11/2024.
//

import SwiftUI



struct ContentView: View {
    
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Button(action: {
                    showingGrid.toggle()
                }) {
                    Text(showingGrid ? "Switch to List View" : "Switch to Grid View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Group {
                    if showingGrid {
                        GridLayout(astronauts: astronauts, missions: missions)
                    } else {
                        ListLayout(astronauts: astronauts, missions: missions)
                    }
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
        }
    }
}

#Preview {
    ContentView()
}
