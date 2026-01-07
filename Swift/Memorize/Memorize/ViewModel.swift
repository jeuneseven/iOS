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
    private static let emojis = ["😈", "👻", "🎃", "🤡", "❤️", "🍚", "🏀", "🍺", "🐷", "🐸", "🐮", "🐱"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁇"
            }
        }
    }
    
    private var game: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
