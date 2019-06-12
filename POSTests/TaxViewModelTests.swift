//
//  TaxViewModelTests.swift
//  POSTests
//
//  Created by Vineet Mrug on 2019-06-11.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import XCTest
@testable import POS
@testable import POSBillCalculator

class TaxViewModelTests: XCTestCase {
    var taxViewModel: TaxViewModel!
    
    override func setUp() {
        super.setUp()
        taxViewModel = TaxViewModel()
    }

    override func tearDown() {
        taxViewModel = nil
        super.tearDown()
    }

    func testTitle() {
        let section = 0
        XCTAssertEqual(taxViewModel.title(for: section), "Taxes")
    }
    
    func testNumberOfSections() {
        let expectedNumberOfSections = 1
        XCTAssertEqual(taxViewModel.numberOfSections(), expectedNumberOfSections)
    }

    func testNumberOfRows() {
        let expectedNumberOfRows = taxes.count
        let section = 0
        XCTAssertEqual(taxViewModel.numberOfRows(in: section), expectedNumberOfRows)
    }

    func testAccessoryType() {
        let testTaxIndex = (taxes.count - 1)
        guard  testTaxIndex >= 0 else { return }
        let section = 0
        let testIndexPath = IndexPath(row: testTaxIndex, section: section)
        let expectedAccessoryType = taxes[testTaxIndex].isEnabled ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        XCTAssertEqual(taxViewModel.accessoryType(at: testIndexPath), expectedAccessoryType)
    }
    
    func testToggleTax() {
        let testTaxIndex = (taxes.count - 1)
        guard  testTaxIndex >= 0 else { return }
        let section = 0
        let testIndexPath = IndexPath(row: testTaxIndex, section: section)
        let expectedTaxIsEnabled = !taxes[testTaxIndex].isEnabled
        taxViewModel.toggleTax(at: testIndexPath)
        XCTAssertEqual(taxes[testTaxIndex].isEnabled, expectedTaxIsEnabled)
    }
}
