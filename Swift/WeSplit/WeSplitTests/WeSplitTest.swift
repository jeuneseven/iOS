//
//  WeSplitTest.swift
//  WeSplitTests
//
//  Created by seven on 2025/9/28.
//

import XCTest
@testable import WeSplit

final class WeSplitTest: XCTestCase {
    
    func testSuccessfulTipCalculation() {
        let vm = ContentView.ViewModel()
        vm.checkAmount = 100.0
        vm.numberOfPeople = 0
        vm.tipPercentage = 20
        
        let tip = vm.totalPerPerson
        
        XCTAssertEqual(tip, 60)
    }

}
