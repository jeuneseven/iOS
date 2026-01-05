//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @State var viewModel: ViewModel
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2 / 3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: ViewModel())
}
