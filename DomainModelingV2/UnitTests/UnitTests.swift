//
//  UnitTests.swift
//  UnitTests
//
//  Created by iGuest on 4/19/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import XCTest

import DomainModelingV2

class UnitTests: XCTestCase {
    
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
    

    
    func testMoneyCustomStringConvertible() {
        print(tenUSD.description)
        XCTAssert(tenUSD.description == "10USD")
    }
    
    func testHourlyJobCustomStringConvertible() {
        let hourlyJob = Job(title: "HourlyJob", type: Job.JobType.Hourly(15.0))
        XCTAssert(hourlyJob.description == "HourlyJob @ 15.0 an hour")
    }
    
    func testSalaryJobCustomStringConvertible() {
        let salaryJob = Job(title: "SalaryJob", type: Job.JobType.Salary(24000))
        XCTAssert(salaryJob.description == "SalaryJob @ 24000 a year")
    }
    
    func testPersonCustomStringConvertible() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Dancer", type: Job.JobType.Salary(10000))
        print(ted.description)
        XCTAssert(ted.description == "[Person: firstName:Ted lastName:Neward age:45 job:Dancer @ 10000 a year spouse:nil]")
    }
    
    func testFamilyCustomStringConvertible() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        
        let family = Family(spouse1: ted, spouse2: charlotte)
        
        print(family.description)
    }
    
    func testDoubleUSDTest() {
        XCTAssert(4.0.USD.description == "4USD")
    }
    
    func testDoubleEURTest() {
        XCTAssert(500.0.EUR.description == "500EUR")
    }
    
    func testDoubleGBPTest() {
        XCTAssert(980.0.GBP.description == "980GBP")
    }
    
    func testDoubleYENTest() {
        XCTAssert(0.0.YEN.description == "0YEN")
    }
    
    func testAddMath() {
        let total = tenUSD.add(tenUSD)
        XCTAssert(total.description == "20USD")
    }
    
    func testSubMath() {
        let total = twelveUSD.subtract(fiveGBP)
        XCTAssert(total.description == "1GBP")
    }
    
}
