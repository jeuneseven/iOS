//
//  ContentView.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/27.
//

import SwiftUI

struct ContentView: View {
    @State private var quoteModel: QuoteModel = QuoteModel()
    @State private var showingAddQuoteView = false
    
    @State private var randomQuote: Quote?
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(quoteModel.quotes, id: \.author) { quote in
                    NavigationLink(value: quote) {
                        HStack {
                            Text("\(quote.author): \(quote.text)")
                                .font(.title2)
                                .foregroundStyle(.primary)
                                .lineLimit(1)
                        }
                    }
                }
                .onDelete(perform: deleteData)
            }
            .navigationTitle("Paraphrase")
            .navigationDestination(item: $randomQuote, destination: { quote in
                Text("\(quote.author) \(quote.text)")
            })
            .navigationDestination(for: Quote.self, destination: { quote in
                VStack {
                    Text("\(quote.text)")
                        .font(.title2)
                        .foregroundStyle(.primary)
                        .padding()
                    Text("\(quote.author)")
                        .font(.title)
                        .foregroundStyle(.primary)
                }
                .padding()
            })
            .sheet(isPresented: $showingAddQuoteView) {
                AddQuoteView(quoteModel: quoteModel)
            }
            .searchable(text: $searchText, prompt: "Please enter")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add new quote", systemImage: "plus") {
                        showingAddQuoteView = true
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Random") {
                        randomQuote = quoteModel.quotes.randomElement()
                    }
                }
            }
        }
    }
    
    func deleteData(at offsets: IndexSet) {
        quoteModel.quotes.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
