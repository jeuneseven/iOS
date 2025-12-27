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
    
    @Test func testRandomQuote() {
        let model = QuotesModel(testing: true)

        guard let quote = model.random() else {
            XCTFail()
            return
        }

        #expect(quote.author == "Eliot")
    }

}
