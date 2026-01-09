//
//  CardView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card
struct CardView: View {
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
    let card: Card
    let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            Group {
                base
                    .foregroundStyle(.white)
                base
                    .stroke(lineWidth: Constants.lineWidth)
                Circle()
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    )
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    CardView(Card(id: "", content: "👻"))
        .padding()
        .foregroundStyle(.orange)
}
