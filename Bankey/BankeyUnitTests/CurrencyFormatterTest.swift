//
//  CurrencyFormatterTest.swift
//  BankeyUnitTests
//
//  Created by Rama Muhammad S on 06/10/23.
//

import Foundation
import XCTest

@testable import Bankey

class CurrencyFormatterTest: XCTestCase {
    var formatter: CurrentFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrentFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatter() throws {
        let result = formatter.dollarsFormatter(2000)
        XCTAssertEqual(result, "$2,000.00")
    }
    
    func testZeroDollarsFormatter() throws{
        let result = formatter.dollarsFormatter(0)
        XCTAssertEqual(result, "$0.00")
    }
    
    func testDollarFormattedWithCurrentSymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatter(929466.23)
        print(currencySymbol)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }
}
