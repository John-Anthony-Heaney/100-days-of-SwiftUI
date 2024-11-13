import SwiftUI

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var count: Int
}

@Observable
class Activities {
    var activities = [Activity]()
}

struct ContentView: View {
    
    @State private var activities = Activities()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(activities.activities) { activity in
                        Text(activity.title) // Display activity titles
                    }
                    .onDelete(perform: deleteActivity) // Swipe-to-delete functionality
                }
                .navigationTitle("Activities")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add", destination: AddActivityView(activities: $activities.activities))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    // Function to handle deletion
    private func deleteActivity(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct AddActivityView: View {
    @Binding var activities: [Activity]
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        Form {
            Section(header: Text("Activity Details")) {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            
            Button("Save Activity") {
                let newActivity = Activity(title: title, description: description, count: 0)
                activities.append(newActivity)
            }
            .disabled(title.isEmpty || description.isEmpty)
        }
        .navigationTitle("Add Activity")
    }
}

#Preview {
    ContentView()
}
