import SwiftUI

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var count: Int
}

class Activities: ObservableObject {
    @Published var activities = [Activity]()
}

struct ContentView: View {
    
    @StateObject private var activities = Activities()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($activities.activities) { $activity in
                        ActivityRow(activity: $activity)
                    }
                    .onDelete(perform: deleteActivity)
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
    
    private func deleteActivity(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }
}

struct ActivityRow: View {
    @Binding var activity: Activity

    var body: some View {
        HStack {
            Text(activity.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Text("\(activity.count)")
                .font(.title3)
                .frame(width: 50)
            
            Button(action: {
                activity.count += 1
            }) {
                Text("+")
                    .frame(width: 30, height: 30)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(5)
            }
            .buttonStyle(.plain) // Prevents the button from being part of the NavigationLink
            
            Button(action: {
                if activity.count > 0 {
                    activity.count -= 1
                }
            }) {
                Text("-")
                    .frame(width: 30, height: 30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(5)
            }
            .buttonStyle(.plain) // Prevents the button from being part of the NavigationLink
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        
        NavigationLink("Description", destination: ActivityDetailView(activity: activity))
            .padding(.vertical)
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

struct ActivityDetailView: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.description)
                .padding()
            
            Spacer()
        }
        .navigationTitle(activity.title)
    }
}

#Preview {
    ContentView()
}
