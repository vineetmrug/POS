//
//  Bill.swift
//  POS
//
//  Created by Vineet Mrug on 2019-06-10.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import UIKit

public class Bill: NSObject {
    public var totalTaxes: NSDecimalNumber
    public var totalDiscounts: NSDecimalNumber
    public var subtotal: NSDecimalNumber
    public var total: NSDecimalNumber {
        let totalValue = subtotal.adding(totalTaxes).subtracting(totalDiscounts)
        return totalValue.compare(NSDecimalNumber.zero) == ComparisonResult.orderedAscending ? NSDecimalNumber.zero : totalValue
    }
    
    public init(subtotal: NSDecimalNumber, totalTaxes: NSDecimalNumber, totalDiscounts: NSDecimalNumber) {
        self.subtotal = subtotal.currencyFormat()
        self.totalTaxes = totalTaxes.currencyFormat()
        self.totalDiscounts = totalDiscounts.currencyFormat()
    }
}
