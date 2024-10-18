//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by John Anthony Heaney on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissors"]
    @State private var outcomes = ["Win", "Lose"]
    @State private var score = 0
    @State private var moveNum = Int.random(in: 0...2)
    @State private var outcomeNum = Int.random(in: 0...1)
    
    
    var body: some View {
        VStack {
            Text("\(moves[moveNum])")
            Text("\(outcomes[outcomeNum])")
            Text("Current Score: \(score)")
            Text("moveNum: \(moveNum)")
            Text("outcomeNum: \(outcomeNum)")
            
            
            HStack {
                ForEach(0..<3) { move in
                    Button {
                        var mech = 0
                        if move-1+(outcomeNum * 2) == -1 {
                            mech = 2
                        } else {
                            mech = move-1+(outcomeNum * 2)
                        }
                        
                        
                        if mech%3 == moveNum {
                            score += 1
                        }
                        moveNum = Int.random(in: 0...2)
                        outcomeNum = Int.random(in: 0...1)
                        
                    } label: {
                        Text(moves[move])
                    }
                }
                .padding()
                .font(.system(size: 30))
            }
            
            
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
