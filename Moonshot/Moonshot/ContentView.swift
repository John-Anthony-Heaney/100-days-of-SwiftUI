import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
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
                .background(Color.darkBackground)
                .preferredColorScheme(.dark)
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

