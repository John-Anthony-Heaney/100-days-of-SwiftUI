//
//  ContentView.swift
//  WordScramble
//
//  Created by John Anthony Heaney on 18/10/2024.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
      Text("Hello world")
    }
    
    func testString() {
        let word = "Swift"
        let checker = UITextChecker()
        
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let missspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = missspelledRange.location == NSNotFound
        
        
    }
}

#Preview {
    ContentView()
}
