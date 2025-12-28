//
//  QuoteModel.swift
//  ParaphraseSwiftUI
//
//  Created by seven on 2025/12/28.
//

import Foundation

struct QuoteModel: Identifiable {
    var id = UUID()
    
    var author: String
    var content: String
}
