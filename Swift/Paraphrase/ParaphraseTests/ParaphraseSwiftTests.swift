//
//  ParaphraseSwiftTests.swift
//  ParaphraseTests
//
//  Created by seven on 2025/12/27.
//  Copyright © 2025 Hacking with Swift. All rights reserved.
//

import Testing
@testable import Paraphrase

struct ParaphraseSwiftTests {

    @Test func testLoadingInitialQuotes() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let model = QuotesModel(testing: true)
        #expect(model.count == 12)
    }
    
    @Test func testRandomQuote() throws {
        let model = QuotesModel(testing: true)

        let quote = try #require(model.random())

        #expect(quote.author == "Eliot")
    }

    @Test func testFormatting() {
        let model = QuotesModel(testing: true)
        let quote = model.quote(at: 0)

        let testString = "\"\(quote.text)\"\n   — \(quote.author)"
        #expect(quote.multiLine == testString)
    }
    
    @Test func testAddingQuote() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count

        let newQuote = Quote(author: "Paul Hudson", text: "Programming is an art. Don't spend all your time sharpening your pencil when you should be drawing.")
        model.add(newQuote)

        #expect(model.count == quoteCount + 1)
    }
    
    @Test func testRemovingQuote() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count

        model.remove(at: 0)
        #expect(model.count == quoteCount - 1)
    }
    
    @Test func testReplacingQuote() {
        var model = QuotesModel(testing: true)

        let newQuote = Quote(author: "Ted Logan", text: "All we are is dust in the wind, dude.")
        model.replace(index: 0, with: newQuote)

        let testQuote = model.quote(at: 0)
        #expect(testQuote.author == "Ted Logan")
    }
    
    @Test func testReplacingEmptyQuote() {
        var model = QuotesModel(testing: true)
        let previousCount = model.count

        let newQuote = Quote(author: "", text: "")
        model.replace(index: 0, with: newQuote)

        #expect(model.count == previousCount - 1)
    }
}
