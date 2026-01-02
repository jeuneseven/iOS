//
//  PlayData.swift
//  ShakeStat
//
//  Created by seven on 2026/1/1.
//

import Foundation

struct PlayData {
    var allWords = [String]()
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]()
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path, encoding: .utf8) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) }
                allWords = sorted as! [String]
                
                filteredWords = allWords
            }
        }
    }
    
    mutating func applyUserFilter(_ input: String) {
        let wordCounts = self.wordCounts!
        
        if let userNumber = Int(input) {
            self.applyFilter { wordCounts.count(for: $0) >= userNumber }
        } else {
            self.applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    mutating func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
