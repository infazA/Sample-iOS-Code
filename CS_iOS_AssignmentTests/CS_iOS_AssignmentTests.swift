//
//  CS_iOS_AssignmentTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Vipul Shah on 23/12/2019.
//  Copyright © 2019 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

class CS_iOS_AssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetNowPlayingMovies() {
        let expect = expectation(description: "Download should succeed")
        
        let apiManager = APIManager()
        apiManager.call(type: EndpointItem.getCurrentlyPlayingMovies, params: nil) { (res: Swift.Result<MovieModel.MovieModelRes,AlertMessage>) in
            
            XCTAssertNotNil(res)
//            XCTAssertNil(res)
            
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error, "Test timed out. \(error?.localizedDescription ?? "")")
        }
    }
}
