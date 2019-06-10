//
//  Menu.swift
//  POS
//
//  Created by Tayson Nguyen on 2019-04-23.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import Foundation

//typealias Item = (name: String, category: String, price: NSDecimalNumber, isTaxExempt: Bool)
//
//func category(_ category: String) -> (String, NSDecimalNumber) -> Item {
//    return { name, price in
//        return (name, category, price, false)
//    }
//}
//
//let appetizers = category("Appetizers")
//let mains = category("Mains")
//let drinks = category("Drinks")
//let alcohol = category("Alcohol")
//
//let appetizersCategory = [
//    appetizers("Nachos", 13.99),
//    appetizers("Calamari", 11.99),
//    appetizers("Caesar Salad", 10.99),
//]
//
//let mainsCategory = [
//    mains("Burger", 9.99),
//    mains("Hotdog", 3.99),
//    mains("Pizza", 12.99),
//]
//
//let drinksCategory = [
//    drinks("Water", 0),
//    drinks("Pop", 2.00),
//    drinks("Orange Juice", 3.00),
//]
//
//let alcoholCategory = [
//    alcohol("Beer", 5.00),
//    alcohol("Cider", 6.00),
//    alcohol("Wine", 7.00),
//]
//
//let tax1 = (label: "Tax 1 (5%)", amount: 0.05, isEnabled: true)
//let tax2 = (label: "Tax 2 (8%)", amount: 0.08, isEnabled: true)
//let alcoholTax = (label: "Alcohol Tax (10%)", amount: 0.10, isEnabled: true)
//
//let discount5Dollars = (label: "$5.00", amount: 5.00, isEnabled: false)
//let discount10Percent = (label: "10%", amount: 0.10, isEnabled: false)
//let discount20Percent = (label: "20%", amount: 0.20, isEnabled: false)


let appetizers = Category(id: "1", name: "Appetizers")
let mains = Category(id: "2", name: "Mains")
let drinks = Category(id: "3", name: "Drinks")
let alcohol = Category(id: "4", name: "Alcohol")

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

let tax1 = Tax(id: "1", rate: 0.05, applicableCategoryIds: ["1","2","3","4"])
let tax2 = Tax(id: "2", rate: 0.08, applicableCategoryIds: ["1","2","3","4"])
let alcoholTax = Tax(id: "3", rate: 0.10, applicableCategoryIds: ["4"], descriptionText: "Alcohol Tax (10%)")

let discount5Dollars = Discount(id: "1", type: DiscountType.dollars(amount: NSDecimalNumber(value: 5.00)))
let discount10Percent = Discount(id: "2", type: DiscountType.percent(rate: NSDecimalNumber(value: 0.1)))
let discount20Percent = Discount(id: "3", type: DiscountType.percent(rate: NSDecimalNumber(value: 0.2)))

var taxes = [
    tax1,
    tax2,
    alcoholTax
]
var taxesEnabled: [Tax] {
    return taxes.filter({$0.isEnabled})
}

var discounts = [
    discount5Dollars,
    discount10Percent,
    discount20Percent,
]
var discountsEnabled: [Discount] {
    return discounts.filter({$0.isEnabled})
}

var categories = [
    (name: "Appetizers", items: appetizersCategory),
    (name: "Mains", items: mainsCategory),
    (name: "Drinks", items: drinksCategory),
    (name: "Alcohol", items: alcoholCategory),
]
