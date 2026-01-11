//
//  AddQuoteView.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/31.
//

import SwiftUI

struct AddQuoteView: View {
    var quoteModel: QuoteModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var author = ""
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Please enter the quote author", text: $author)
                
                TextField("Please enter the quote content", text: $text)
            }
            .navigationTitle("Add New Quote")
            .toolbar {
                Button("Save") {
                    quoteModel.quotes.append(Quote(author: author, text: text))
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddQuoteView(quoteModel: QuoteModel())
}
