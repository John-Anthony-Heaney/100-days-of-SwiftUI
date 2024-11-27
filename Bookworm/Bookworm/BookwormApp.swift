//
//  BookwormApp.swift
//  Bookworm
//
//  Created by John Anthony Heaney on 27/11/2024.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
