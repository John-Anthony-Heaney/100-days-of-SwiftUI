//
//  MissionView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 08/11/2024.
//

import SwiftUI

struct MissionView: View {
   
    
    let mission: Mission
    
    let crew: [CrewMember]
    
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
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                Text("Mission Highlights")
                    .font(.title.bold())
                
                Text(mission.formattedLaunchDate)
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.bottom,8)
                
                Text(mission.description)
                
                
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                Text("Crew")
                    .font(.title.bold())
                    .padding(.bottom, 5)
                
            }
            .padding(.horizontal)
            
            CrewView(crew:crew)
            
        }
        .padding(.bottom)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("Missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
