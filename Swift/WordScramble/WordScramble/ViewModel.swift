//
//  ViewModel.swift
//  WordScramble
//
//  Created by seven on 2025/9/9.
//

import Foundation
import SwiftUI
import Observation

@Observable
class ViewModel {
     var usedWords = [String]()
     var rootWord = ""
     var newWord = ""
    
     var showingAlert = false
     var alertTitle = ""
     var alertContent = ""
    
    func addNewWord() {
        let typeinWord = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard typeinWord.count > 0 else {return}
        guard isOriginal(word: typeinWord) else {
            showAlert(title: "Word used already", content: "Be more original")
            return
        }
        guard isReal(word: typeinWord) else {
            showAlert(title: "Word not recognized", content: "You can't just make them up, you know!")
            return
        }
        guard isPossible(word: typeinWord) else {
            showAlert(title: "Word not possible", content: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        withAnimation {
            usedWords.insert(typeinWord, at: 0)
        }
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func showAlert(title: String, content: String) {
        alertTitle = title
        alertContent = content
        
        showingAlert = true
    }
    
    func startGame() {
        if let file = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let content = try? String(contentsOf: file, encoding: .utf8) {
                rootWord = content.components(separatedBy: "\n").randomElement() ?? "swift"
                return
            }
        }
        
        fatalError("Can not load file from bundle!")
    }
}
