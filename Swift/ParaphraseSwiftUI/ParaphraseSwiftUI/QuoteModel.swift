//
//  QuoteModel.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/28.
//

import Foundation
import Observation

struct Quote: Codable, Hashable {
//    var id = UUID()
    
    var author: String
    var text: String
}

@Observable
class QuoteModel {
    var quotes: [Quote] = Bundle.main.decode("initial-quotes.json")
}
