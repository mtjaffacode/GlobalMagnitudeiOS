//
//  GlobalMagnitudeTests.swift
//  GlobalMagnitudeTests
//
//  Created by Matthew Jaffa on 1/11/18.
//  Copyright © 2018 Jaffaware LLC. All rights reserved.
//

import XCTest
@testable import GlobalMagnitude

class GlobalMagnitudeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(!GlobalMagnitudeUtils.isMultiplicationCorrect(number1: 67, number2: 45, answer: 210), "Should return false")
        XCTAssert(GlobalMagnitudeUtils.isMultiplicationCorrect(number1: 67, number2: 45, answer: 3015), "Should return true")
    }
    
    func testRandomTwoDigitNumber() {
        for _ in 0...12000 {
            let twoDigitNumber = GlobalMagnitudeUtils.generateRandomTwoDigitNumber()
            XCTAssertTrue(10 <= twoDigitNumber, "\(twoDigitNumber) Must be a double digit number greater than 10")
            XCTAssertTrue(99 >= twoDigitNumber, "\(twoDigitNumber) Must be a double digit number less than or equal to 99")
        }
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
