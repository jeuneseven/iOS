//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @State var viewModel: ViewModel
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: ViewModel())
}
