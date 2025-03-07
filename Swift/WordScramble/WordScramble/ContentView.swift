//
//  ContentView.swift
//  WordScramble
//
//  Created by seven on 2025/3/6.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        Text("Hello, World")
    }
    
//    func test() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ")
//        
//        let anotherInput = """
//                    a
//                    b
//                    c
//                    """
//        let anotherLetters = input.components(separatedBy: "\n")
//        
//        let letter = letters.randomElement()
//        
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        let word = "swift"
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        let allGood = misspelledRange.location == NSNotFound
//    }
    
//    func loadFile() {
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            // we found the file in our bundle!
//            if let fileContents = try? String(contentsOf: fileURL) {
//                // we loaded the file into a string!
//            }
//        }
//    }
    
//    let people = ["Finn", "Leia", "Luke", "Rey"]
//
//    var body: some View {
//        List(people, id: \.self) {
//            Text($0)
//        }
//        .listStyle(.grouped)
//        
//        List {
//            Section("Section 1") {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section("Section 2") {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section("Section 3") {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }
//        .listStyle(.grouped)
//    }
}

#Preview {
    ContentView()
}
