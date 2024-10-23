//
//  ContentView.swift
//  iExpense
//
//  Created by John Anthony Heaney on 23/10/2024.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
    }
}


struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "John Anthony")
        }
    }
}

#Preview {
    ContentView()
}
