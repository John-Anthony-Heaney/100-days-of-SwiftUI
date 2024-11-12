//
//  ContentView.swift
//  Navigation
//
//  Created by John Anthony Heaney on 12/11/2024.
//

import SwiftUI


struct ContentView: View {
   
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap me") {
                        //Button action
                        }
                    
                        Button("Tap me") {
                        //Button action
                        }
                    }
                }
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ContentView()
}
