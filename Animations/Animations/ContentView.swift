//
//  ContentView.swift
//  Animations
//
//  Created by John Anthony Heaney on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        
        .background(enabled ?.blue : .red)
        .foregroundStyle(.white)
        .animation(nil, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
        //.background(enabled ?.blue : .red)
       
    }
}

#Preview {
    ContentView()
}
