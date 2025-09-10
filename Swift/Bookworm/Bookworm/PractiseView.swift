//
//  PractiseView.swift
//  WeSplit
//
//  Created by seven on 2025/8/25.
//

import SwiftData
import SwiftUI

struct PractiseView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort:[
        SortDescriptor(\BookModel.title, order: .reverse),
        SortDescriptor(\BookModel.author)
    ]) var books: [BookModel]
    
    @State private var showingAddBookDetailView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRateView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: BookModel.self) { book in
                BookDetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        showingAddBookDetailView = true
                    }
                }
            }
            .sheet(isPresented: $showingAddBookDetailView) {
                AddBookDetailView()
            }
        }
    }
    
    func deleteBook(at offsets:IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
            try? modelContext.save()
        }
    }
}

#Preview {
    PractiseView()
}
