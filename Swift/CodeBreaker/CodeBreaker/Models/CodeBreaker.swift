//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by seven on 2026/1/15.
//

import Foundation
import SwiftUI

typealias Peg = Color

extension Peg {
    static let missing = Color.clear
}

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master(isHidden: true))
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    let pegChoices: [Peg]
    
    var startTime: Date = .now
    var endTime: Date?
    var elapsedTime: TimeInterval = 0
    
    var isOver: Bool {
        attempts.last?.pegs == masterCode.pegs
//        endTime = .now
    }
    
    init(pegChoices:[Peg] = [.red, .yellow, .blue, .green]) {
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
    }
    
    mutating func restart() {
        masterCode.kind = .master(isHidden: true)
        masterCode.randomize(from: pegChoices)
        guess.reset()
        attempts.removeAll()
        startTime = .now
        endTime = nil
//        elapsedTime = 0
//        isOver = false
    }
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guard guess.pegs.indices.contains(index) else { return }
        guess.pegs[index] = peg
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
        guess.reset()
        
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
}
