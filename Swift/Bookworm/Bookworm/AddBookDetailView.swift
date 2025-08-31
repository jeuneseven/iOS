//
//  AddBookDetailView.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import SwiftUI
import SwiftData

struct AddBookDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    @State private var review = ""
    
    private var saveEnable: Bool {
        title.isEmpty || author.isEmpty
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter a book title", text: $title)
                    TextField("Enter the author", text: $author)
                    
                    Picker("Select a genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("Please enter a review", text: $review, axis: .vertical)
                    RateView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let book = BookModel(title: title, genre: genre, author: author, review: review, rating: rating)
                        
                        modelContext.insert(book)
                        try? modelContext.save()
                        
                        dismiss()
                    }
                }
                .disabled(saveEnable)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookDetailView()
}
