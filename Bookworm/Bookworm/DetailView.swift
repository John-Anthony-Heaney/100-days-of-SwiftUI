//
//  DetailView.swift
//  Bookworm
//
//  Created by John Anthony Heaney on 04/12/2024.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
                
        }
        .navigationTitle(book.title)
    }
}

#Preview {
    if let container = try? ModelContainer(for: Book.self, configurations: .init(isStoredInMemoryOnly: true)) {
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)

        DetailView(book: example)
            .modelContainer(container)
    } else {
        Text("Failed to create preview: Unable to initialize container.")
    }
}

