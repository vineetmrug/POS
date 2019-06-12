//
//  Menu.swift
//  POS
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation
import POSBillCalculator

let appetizers = POSCategory(id: "1", name: "Appetizers")
let mains = POSCategory(id: "2", name: "Mains")
let drinks = POSCategory(id: "3", name: "Drinks")
let alcohol = POSCategory(id: "4", name: "Alcohol")

let appetizersCategory = [
    appetizers.addItem(itemId: "1", name: "Nachos", price: 13.99),
    appetizers.addItem(itemId: "2", name: "Calamari", price: 11.99),
    appetizers.addItem(itemId: "3", name: "Caesar Salad", price: 10.99)
]

let mainsCategory = [
    mains.addItem(itemId: "4", name: "Burger", price: 9.99),
    mains.addItem(itemId: "5", name: "Hotdog", price: 3.99),
    mains.addItem(itemId: "6", name: "Pizza", price: 12.99)
]

let drinksCategory = [
    drinks.addItem(itemId: "7", name: "Water", price: 0),
    drinks.addItem(itemId: "8", name: "Pop", price: 2.00),
    drinks.addItem(itemId: "9", name: "Orange Juice", price: 3.00, isTaxExempt: true)
]

let alcoholCategory = [
    alcohol.addItem(itemId: "10", name: "Beer", price: 5.00),
    alcohol.addItem(itemId: "11", name: "Cider", price: 6.00),
    alcohol.addItem(itemId: "12", name: "Wine", price: 7.00)
]

let tax1 = POSTax(id: "1", rate: 0.05, applicableCategoryIds: ["1","2","3","4"])
let tax2 = POSTax(id: "2", rate: 0.08, applicableCategoryIds: ["1","2","3","4"])
let alcoholTax = POSTax(id: "3", rate: 0.10, applicableCategoryIds: ["4"], descriptionText: "Alcohol Tax (10%)")

let discount5Dollars = POSDiscount(id: "1", type: POSDiscountType.dollars(amount: NSDecimalNumber(value: 5.00)))
let discount10Percent = POSDiscount(id: "2", type: POSDiscountType.percent(rate: NSDecimalNumber(value: 0.1)))
let discount20Percent = POSDiscount(id: "3", type: POSDiscountType.percent(rate: NSDecimalNumber(value: 0.2)))

var taxes = [
    tax1,
    tax2,
    alcoholTax
]
var taxesEnabled: [POSTax] {
    return taxes.filter({$0.isEnabled})
}

var discounts = [
    discount5Dollars,
    discount10Percent,
    discount20Percent,
]
var discountsEnabled: [POSDiscount] {
    return discounts.filter({$0.isEnabled})
}

var categories = [
    (name: "Appetizers", items: appetizersCategory),
    (name: "Mains", items: mainsCategory),
    (name: "Drinks", items: drinksCategory),
    (name: "Alcohol", items: alcoholCategory),
]
