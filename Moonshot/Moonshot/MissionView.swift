//
//  MissionView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 08/11/2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6}
                    }
            
            VStack(alignment: .leading) {
                Text("Mission Highlights")
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
                Text(mission.description)
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("Missions.json")
    
    return MissionView(mission: missions[0])
        .preferredColorScheme(.dark)
}
