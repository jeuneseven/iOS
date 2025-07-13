//: [Previous](@previous)

import UIKit
import Foundation

let word = "swifta"
let checker = UITextChecker()
let range = NSRange(location: 0, length: word.utf16.count)
let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
let allGood = misspelledRange.location == NSNotFound
print(allGood, misspelledRange)

//: [Next](@next)
