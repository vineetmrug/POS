//
//  POSTax.swift
//  Pods-POSBillCalculator_Example
//
//  Created by Vineet Mrug on 2019-06-11.
//

import UIKit

public class POSTax: NSObject {
    public var id: String
    public var rate: NSDecimalNumber
    public var applicableCategoryIds: [String]
    public var descriptionText: String
    public var isEnabled = true
    
    public init(id: String, rate: Double, applicableCategoryIds: [String], descriptionText: String? = nil) {
        self.id = id
        let rateDecimal = NSDecimalNumber(value: rate)
        self.rate = rateDecimal
        self.applicableCategoryIds = applicableCategoryIds
        self.descriptionText = descriptionText ?? "Tax \(id) (\(rateDecimal.multiplying(byPowerOf10: 2))%)"
    }
}
