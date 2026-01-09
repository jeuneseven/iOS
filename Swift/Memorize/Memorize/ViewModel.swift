//
//  ViewModel.swift
//  Memorize
//
//  Created by seven on 2026/1/5.
//

import SwiftUI
import Foundation
import Observation

@Observable
class ViewModel {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["😈", "👻", "🎃", "🤡", "❤️", "🍚", "🏀", "🍺", "🐷", "🐸", "🐮", "🐱"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁇"
            }
        }
    }
    
    private var game: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<Card> {
        return game.cards
    }
    
    var color: Color {
        .orange
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: Card) {
        game.choose(card)
    }
}
