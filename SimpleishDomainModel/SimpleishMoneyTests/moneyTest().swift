//
//  moneyTest().swift
//  SimpleishDomainModel
//
//  Created by iGuest on 4/19/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import XCTest

class moneyTest__: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    let fiveGBP = Money(amount: 5, currency: "GBP")
    let fifteenEUR = Money(amount: 15, currency: "EUR")
    let fifteenCAN = Money(amount: 15, currency: "CAN")

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
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMoneyCustomStringConvertible() {
        print(tenUSD.description)
        XCTAssert(tenUSD.description == "10USD")
    }
    
    func testJobCustomStringConvertible() {
        print(tenUSD.description)
        XCTAssert(tenUSD.description == "10USD")
    }
    
    func testPersonCustomStringConvertible() {
        print(tenUSD.description)
        XCTAssert(tenUSD.description == "10USD")
    }
    
    func testFamilyCustomStringConvertible() {
        print(tenUSD.description)
        XCTAssert(tenUSD.description == "10USD")
    }

}
