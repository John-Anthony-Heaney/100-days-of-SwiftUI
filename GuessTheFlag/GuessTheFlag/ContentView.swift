//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by John Anthony Heaney on 16/10/2024.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(.capsule)
            .shadow(radius: 5)
            
    }
}

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .modifier(Title())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var questionsRemaining = 8
    
    @State private var rotationAngles = [0.0, 0.0, 0.0]
    
    @State private var selectedFlag: Int? = nil
    
    @State private var isFaded = false
   
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                self.rotationAngles[number] += 360
                                self.selectedFlag = number
                                self.isFaded.toggle()
                            }
                            flagTapped(number)
                            

                            
                        }) {
                            
                                FlagImage(imageName:countries[number])
                                    .frame(width: 100, height: 100)
                                    .opacity(isFaded ? 0.25 : 1.0)
                                    .rotation3DEffect(
                                        .degrees(rotationAngles[number]),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                                
                            

                            
                        }
                    }
                }
                .frame(maxWidth:. infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius:20))
                
                Spacer()
                Spacer()
                
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if questionsRemaining == 0 {
                Button("Restart", action: restart)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
    func flagTapped (_ number: Int) {
        if questionsRemaining == 1 {
            scoreTitle = "Game Over would you like to play again?"
            questionsRemaining -= 1
        }
         else if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            questionsRemaining -= 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            questionsRemaining -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restart () {
        score = 0
        questionsRemaining = 8
    }
   
}

#Preview {
    ContentView()
}
