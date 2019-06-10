//
//  Tax.swift
//  POS
//
//  Created by Vineet Mrug on 2019-06-09.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import UIKit

public class Tax: NSObject {
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
