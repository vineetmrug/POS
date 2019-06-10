//
//  BillCalculator.swift
//  POS
//
//  Created by Vineet Mrug on 2019-06-10.
//  Copyright © 2019 TouchBistro. All rights reserved.
//

import UIKit

public class BillCalculator: NSObject {
    public func generateBill(billItems: [BillItem], taxes: [Tax], discounts: [Discount]) -> Bill {
        let subtotal = calculateSubtotal(billItems: billItems)
        let totalTaxAmount = calculateTaxes(billItems: billItems, taxes: taxes)
        let totalDiscountAmount = calculateDiscounts(subtotal: subtotal, discounts: discounts)

        return Bill(subtotal: subtotal, totalTaxes: totalTaxAmount, totalDiscounts: totalDiscountAmount)
    }
}

fileprivate extension BillCalculator {
    func calculateSubtotal(billItems: [BillItem]) -> NSDecimalNumber {
        var subtotal = NSDecimalNumber.zero
        for billItem in billItems {
            subtotal = subtotal.adding(billItem.price)
        }
        return subtotal
    }
    
    func calculateTaxes(billItems: [BillItem], taxes: [Tax]) -> NSDecimalNumber {
        var totalTaxAmount = NSDecimalNumber.zero
        for tax in taxes {
            var taxableAmount = NSDecimalNumber.zero
            for billItem in billItems {
                if !billItem.isTaxExempt && tax.applicableCategoryIds.contains(billItem.category.id) {
                    taxableAmount = taxableAmount.adding(billItem.price)
                }
            }
            let taxAmount = taxableAmount.multiplying(by: tax.rate)
            totalTaxAmount = totalTaxAmount.adding(taxAmount)
        }
        return totalTaxAmount
    }
    
    func calculateDiscounts(subtotal: NSDecimalNumber, discounts: [Discount]) -> NSDecimalNumber {
        var totalDollarDiscount = NSDecimalNumber.zero
        var totalPercentageDiscount = NSDecimalNumber.zero
        var percentDiscountRateArray = [NSDecimalNumber]()
        for discount in discounts {
            switch discount.type {
            case .dollars(let amount):
                totalDollarDiscount = totalDollarDiscount.adding(amount)
            case .percent(let rate):
                percentDiscountRateArray.append(rate)
            }
        }
        var principalAmount = subtotal.subtracting(totalDollarDiscount)
        for discountRate in percentDiscountRateArray {
            let discountAmount = principalAmount.multiplying(by: discountRate)
            totalPercentageDiscount = totalPercentageDiscount.adding(discountAmount)
            principalAmount = principalAmount.subtracting(discountAmount)
        }
        return totalDollarDiscount.adding(totalPercentageDiscount)
    }
}
