//
//  ContentView.swift
//  WeSplit
//
//  Created by John Anthony Heaney on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students,id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}
