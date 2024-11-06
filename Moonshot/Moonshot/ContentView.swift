//
//  ContentView.swift
//  Moonshot
//
//  Created by John Anthony Heaney on 06/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
        
    }
}

#Preview {
    ContentView()
}
