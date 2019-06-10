//
//  Discount.swift
//  POS
//
//  Created by Vineet Mrug on 2019-06-09.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import UIKit

public enum DiscountType {
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

public class Discount: NSObject {
    public var id: String
    public var type: DiscountType
    public var descriptionText: String
    public var isEnabled = false

    public init(id: String, type: DiscountType) {
        self.id = id
        self.type = type
        self.descriptionText = type.descriptionText()
    }
}
