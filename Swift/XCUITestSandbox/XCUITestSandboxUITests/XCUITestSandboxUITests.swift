//
//  XCUITestSandboxUITests.swift
//  XCUITestSandboxUITests
//
//  Created by seven on 2026/1/1.
//  Copyright © 2026 Hacking with Swift. All rights reserved.
//

import XCTest

final class XCUITestSandboxUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testLabelCopiesTextField() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["inputTextField"]
        textField.tap()
        textField.typeText("test\n")
        
        
        let resultLabel = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultLabel.label, "test")
    }
    
    @MainActor
    func testSliderControlsProgress() {
        let app = XCUIApplication()
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 1)
        
        guard let completion = app.progressIndicators.element.value as? String else {
            XCTFail()
            return
        }

        XCTAssertTrue(completion == "0%")
    }
    
    @MainActor
    func testButtonsShowAlerts() {
        let app = XCUIApplication()
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
