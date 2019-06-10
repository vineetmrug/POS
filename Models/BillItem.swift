//
//  BillItem.swift
//  POS
//
//  Created by Vineet Mrug on 2019-06-09.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import UIKit

public class BillItem: NSObject {
    public var id: String
    public var name: String
    public var category: Category
    public var price: NSDecimalNumber
    public var isTaxExempt: Bool
    
    fileprivate init(id: String, name: String, category: Category, price: NSDecimalNumber, isTaxExempt: Bool) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
        self.isTaxExempt = isTaxExempt
    }
}

public class Category: NSObject {
    public var id: String
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    public func addItem(itemId: String, name: String, price: Double, isTaxExempt: Bool = false) -> BillItem {
        return BillItem(id: itemId, name: name, category: self, price: NSDecimalNumber(value: price), isTaxExempt: isTaxExempt)
    }
}
