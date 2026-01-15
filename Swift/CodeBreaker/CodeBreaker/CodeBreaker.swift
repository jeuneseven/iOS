//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by seven on 2026/1/15.
//

import Foundation
import SwiftUI

typealias Peg = Color

struct Code {
    var kind: Kind
    var pegs: [Peg] = [.red, .yellow, .blue, .green]
    
    static let missing: Peg = .clear
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    let pegChoice: [Peg] = [.red, .yellow, .blue, .green]
    
    func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt
        attempts.append(attempt)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoice.firstIndex(of: existingPeg) {
            let newPeg = pegChoice[(indexOfExistingPegInPegChoices + 1) % pegChoice.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoice.first ?? Code.missing
        }
    }
}
