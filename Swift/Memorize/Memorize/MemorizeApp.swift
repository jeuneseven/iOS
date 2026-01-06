//
//  MemorizeApp.swift
//  Memorize
//
//  Created by seven on 2026/1/4.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = ViewModel()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
