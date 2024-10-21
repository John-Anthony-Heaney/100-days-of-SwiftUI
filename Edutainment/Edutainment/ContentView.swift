//
//  ContentView.swift
//  Edutainment
//
//  Created by John Anthony Heaney on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 2
    @State private var secondNumber = 0
    @State private var userAnswer = ""
    @State private var feedbackMessage = ""
    @State private var score = 0
    @State private var questionCount = 1
    @State private var questionNum = 5
    
    var correctAnswer: Int {
        return firstNumber * secondNumber
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Multplication Quiz")
                .font(.largeTitle.bold())
                .padding()
            
            Section {
                Stepper(value: $firstNumber, in: 2...12, step: 1) {
                    Text("\(firstNumber) times tables ")
                }
                .padding()
            }
            
            Section {
                Stepper(value: $questionNum, in: 5...20, step: 5) {
                    Text("number of questions \(questionNum) ")
                }
                .padding()
            }
            
            Text("Question \(questionCount)")
                .font(.title2)
                .padding()
            
            Text("\(firstNumber) x \(secondNumber) = ?")
                .font(.title)
            
            TextField("Enter your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit Answer") {
                checkAnswer()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
            
            Text(feedbackMessage)
                .font(.title2)
                .foregroundStyle(.green)
            
            
            Text("Score: \(score)")
                .font(.title2)
            
            Button("Reset Game") {
                resetGame()
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear(perform: generateQuestion)
    }
    
    func checkAnswer() {
        guard let userAnswerInt = Int(userAnswer) else {
            feedbackMessage = "Please enter a valid number."
            return
        }
        
        if userAnswerInt == correctAnswer {
            feedbackMessage = "Correct!"
            score += 1
        } else {
            feedbackMessage = "Wrong! The correct answer was \(correctAnswer)."
        }
        
        questionCount += 1
        if  questionCount <= questionNum {
            generateQuestion()
        } else {
            feedbackMessage = "Game over! Your Final score is \(score)"
        }
    }
    
    func generateQuestion() {
        secondNumber = Int.random(in: 1...12)
        userAnswer = ""
    }
    
    
    func nextQuestion() {
        userAnswer = ""
        questionCount += 1
        generateQuestion()
    }
    
    func resetGame() {
        score = 0
        questionCount = 1
        feedbackMessage = ""
        generateQuestion()
    }
}

#Preview {
    ContentView()
}
