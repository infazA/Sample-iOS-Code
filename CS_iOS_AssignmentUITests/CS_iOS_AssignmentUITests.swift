//
//  CS_iOS_AssignmentUITests.swift
//  CS_iOS_AssignmentUITests
//
//  Created by Vipul Shah on 23/12/2019.
//  Copyright © 2019 Backbase. All rights reserved.
//

import XCTest

class CS_iOS_AssignmentUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableScrolling() {
        // UI tests must launch the application that they test.
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Scoob!")/*[[".cells.containing(.staticText, identifier:\"2020-05-15\")",".cells.containing(.staticText, identifier:\"Scoob!\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).swipeUp()
        tablesQuery.cells.containing(.staticText, identifier:"Survive the Night").children(matching: .other).element(boundBy: 0).swipeUp()
    }
    
    func testTableScrollAndTopScroll() {
        let tablesQuery = XCUIApplication().tables
        let element = tablesQuery/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0)
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        element.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Scoob!")/*[[".cells.containing(.staticText, identifier:\"2020-05-15\")",".cells.containing(.staticText, identifier:\"Scoob!\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Bad Boys for Life").children(matching: .other).element(boundBy: 0).swipeLeft()/*[[".cells.containing(.staticText, identifier:\"2020-01-15\").children(matching: .other).element(boundBy: 0)",".swipeUp()",".swipeLeft()",".cells.containing(.staticText, identifier:\"Bad Boys for Life\").children(matching: .other).element(boundBy: 0)"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        let element2 = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Extraction")/*[[".cells.containing(.staticText, identifier:\"2020-04-24\")",".cells.containing(.staticText, identifier:\"Extraction\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0)
        element2.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Frozen II")/*[[".cells.containing(.staticText, identifier:\"2019-11-20\")",".cells.containing(.staticText, identifier:\"Frozen II\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Justice League Dark: Apokolips War"]/*[[".cells.staticTexts[\"Justice League Dark: Apokolips War\"]",".staticTexts[\"Justice League Dark: Apokolips War\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Star Wars: The Rise of Skywalker")/*[[".cells.containing(.staticText, identifier:\"2019-12-18\")",".cells.containing(.staticText, identifier:\"Star Wars: The Rise of Skywalker\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).swipeDown()
        element2.tap()
        element2.swipeDown()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
