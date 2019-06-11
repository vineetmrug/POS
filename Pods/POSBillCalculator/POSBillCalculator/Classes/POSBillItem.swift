//
//  POSBillItem.swift
//  Pods-POSBillCalculator_Example
//
//  Created by Vineet Mrug on 2019-06-11.
//

import UIKit

public class POSBillItem: NSObject {
    public var id: String
    public var name: String
    public var category: POSCategory
    public var price: NSDecimalNumber
    public var isTaxExempt: Bool
    
    fileprivate init(id: String, name: String, category: POSCategory, price: NSDecimalNumber, isTaxExempt: Bool) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
        self.isTaxExempt = isTaxExempt
    }
}

public class POSCategory: NSObject {
    public var id: String
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    public func addItem(itemId: String, name: String, price: Double, isTaxExempt: Bool = false) -> POSBillItem {
        return POSBillItem(id: itemId, name: name, category: self, price: NSDecimalNumber(value: price), isTaxExempt: isTaxExempt)
    }
}
