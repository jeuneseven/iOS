//
//  BookDetailView.swift
//  Bookworm
//
//  Created by seven on 2025/8/31.
//

import SwiftUI
import SwiftData

struct BookDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var isShowingAlert = false
    
    let book: BookModel
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .fontWeight(.black)
                    .background(.black)
                    .clipShape(.capsule)
                    .padding(8)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
                .padding()

            Text(book.review)
                .padding()
            
            RateView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .toolbar {
            Button("Delete", systemImage: "trash") {
                isShowingAlert = true
            }
        }
        .alert("Delete this book", isPresented: $isShowingAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel, action: {})
        } message: {
            Text("Are you sure?")
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BookModel.self, configurations: config)
        
        return BookDetailView(book: BookModel.example)
            .modelContainer(container)
    } catch {
        return Text("Falled to load a preview book \(error.localizedDescription)")
    }
}
