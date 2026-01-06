//
//  CardView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    let base = RoundedRectangle(cornerRadius: 12)
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            Group {
                base
                    .foregroundStyle(.white)
                base
                    .stroke(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    CardView(MemoryGame<String>.Card(id: "", content: "👻"))
}
