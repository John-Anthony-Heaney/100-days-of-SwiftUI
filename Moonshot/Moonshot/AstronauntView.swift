//
//  AstronauntView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 08/11/2024.
//

import SwiftUI

struct AstronauntView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            Image(astronaut.id)
                .resizable()
                .scaledToFit()
            
            Text(astronaut.description)
                .padding()
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronauntView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
    
}
