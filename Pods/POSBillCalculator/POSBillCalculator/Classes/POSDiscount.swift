//
//  POSDiscount.swift
//  Pods-POSBillCalculator_Example
//
//  Created by Vineet Mrug on 2019-06-11.
//

import UIKit

public enum POSDiscountType {
    case percent(rate: NSDecimalNumber)
    case dollars(amount: NSDecimalNumber)
    
    func descriptionText() -> String {
        switch self {
        case .dollars(let amount):
            return "$\(amount)"
        case .percent(let rate):
            return "\(rate.multiplying(byPowerOf10: 2))%"
        }
    }
}

public class POSDiscount: NSObject {
    public var id: String
    public var type: POSDiscountType
    public var descriptionText: String
    public var isEnabled = false
    
    public init(id: String, type: POSDiscountType) {
        self.id = id
        self.type = type
        self.descriptionText = type.descriptionText()
    }
}
