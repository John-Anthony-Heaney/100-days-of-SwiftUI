//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by John Anthony Heaney on 17/10/2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 36, weight: .bold))
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(TitleModifier())
    }
}


struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
