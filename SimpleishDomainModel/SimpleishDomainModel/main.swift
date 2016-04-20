//
//  main.swift
//  SimpleishDomainModel
//
//  Created by iGuest on 4/19/16.
//  Copyright © 2016 Tanner. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
    return "I have been tested"
}

public class TestMe {
    public func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Protocols
//

protocol Mathematics {
    
    func add() -> Double
    
    func subtract() -> Double
}

////////////////////////////////////
// Money
//
public struct Money : CustomStringConvertible {
    public var amount : Int
    public var currency : String
    public var description: String {
        return ToString()
    }
    
    public func convert(to: String) -> Money {
        if currency == "USD" {
            switch to {
            case "GBP":
                return Money(amount: amount / 2, currency: "GBP")
            case "EUR":
                return Money(amount: (amount * 3) / 2, currency: "EUR")
            case "CAN":
                return Money(amount: (amount * 5) / 4, currency: "CAN")
            default:
                return Money(amount: amount, currency: currency)
            }
        } else if currency == "GBP" {
            switch to {
            case "USD":
                return Money(amount: amount * 2, currency: "USD")
            case "EUR":
                return Money(amount: amount * 3, currency: "EUR")
            case "CAN":
                return Money(amount: (amount * 5) / 2, currency: "CAN")
            default:
                return Money(amount: amount, currency: currency)
            }
        } else if currency == "EUR" {
            switch to {
            case "GBP":
                return Money(amount: amount / 3, currency: "GBP")
            case "USD":
                return Money(amount: (amount * 2) / 3, currency: "USD")
            case "CAN":
                return Money(amount: (amount * 5) / 6, currency: "CAN")
            default:
                return Money(amount: amount, currency: currency)
            }
        } else {
            switch to {
            case "GBP":
                return Money(amount: (amount * 2) / 5, currency: "GBP")
            case "EUR":
                return Money(amount: (amount * 6) / 5, currency: "EUR")
            case "USD":
                return Money(amount: (amount * 4) / 5, currency: "USD")
            default:
                return Money(amount: amount, currency: currency)
            }
        }
    }
    
    public func add(to: Money) -> Money {
        return Money(amount: self.convert(to.currency).amount + to.amount, currency: to.currency)
    }
    public func subtract(from: Money) -> Money {
        return Money(amount: self.convert(from.currency).amount - from.amount, currency: from.currency)
    }
    public func ToString() -> String {
        return "\(amount)\(currency)"
    }
}


////////////////////////////////////
// Job
//
public class Job {
    var title: String
    var salary: JobType
    public var description : String {
        return ToString()
    }
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.salary = type
    }
    
    public func calculateIncome(hours: Int) -> Int {
        switch salary {
        case .Hourly(let hourlySalary):
            return Int(hourlySalary * Double(hours))
        case .Salary(let lumpSalary):
            return lumpSalary
        }
    }
    
    public func raise(amt : Double) {
        switch salary {
        case .Hourly(let hourlySalary):
            salary = .Hourly(hourlySalary + amt)
        case .Salary(let lumpSalary):
            salary = .Salary(Int(Double(lumpSalary) + amt))
        }
    }
    
    public func ToString() -> String {
        switch salary {
        case .Hourly(let hourlySalary):
            return "\(title) @ \(hourlySalary) an hour"
        case .Salary(let lumpSalary) :
            return "\(title) @ \(lumpSalary) a year"
        }
    }
}

////////////////////////////////////
// Person
//
public class Person {
    public var firstName : String = ""
    public var lastName : String = ""
    public var age : Int = 0
    private var _job : Job?
    private var _spouce : Person?
    
    public var job : Job? {
        get {return _job}
        set(value) {
            if age > 16 {
                _job = value
            } else {
                _job = nil
            }
        }
    }
    
    public var spouse : Person? {
        get {return _spouce}
        set(value) {
            if age > 18 {
                _spouce = value
            } else {
                _spouce = nil
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    public func toString() -> String {
        return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(_job) spouse:\(_spouce)]"
    }
}

////////////////////////////////////
// Family
//
public class Family {
    private var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
        if(spouse1.spouse == nil && spouse2.spouse == nil && spouse1.age >= 18 && spouse2.age >= 18) {
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    
    public func haveChild(child: Person) -> Bool {
        members.append(child)
        return true
    }
    
    public func householdIncome() -> Int {
        var familyIncome = 0
        for person in members {
            if(person.job != nil) {
                var personIncome: Int
                switch person.job!.salary {
                case .Hourly:
                    personIncome = person.job!.calculateIncome(2000)
                case .Salary(let lumpSalary):
                    personIncome = lumpSalary
                }
                familyIncome += personIncome
            }
        }
        return familyIncome
    }
}