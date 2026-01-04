//
//  ContentView.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😈", "👻", "🎃", "🤡", "❤️", "🍚", "🏀", "🍺", "🐷", "🐸", "🐮", "🐱"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            cardsController
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    private var cardsController: some View {
        HStack {
            cardcountAdjuster(by: -1, symbol: "minus")
            
            Spacer()
            
            cardcountAdjuster(by: +1, symbol: "plus")
        }
        .font(.largeTitle)
    }
    
    func cardcountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}

#Preview {
    ContentView()
}
