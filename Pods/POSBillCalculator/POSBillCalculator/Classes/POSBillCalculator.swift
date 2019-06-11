//
//  POSBillCalculator.swift
//  Pods-POSBillCalculator_Example
//
//  Created by Vineet Mrug on 2019-06-11.
//

import UIKit

public class POSBillCalculator: NSObject {
    public func generateBill(billItems: [POSBillItem], taxes: [POSTax], discounts: [POSDiscount]) -> POSBill {
        let subtotal = calculateSubtotal(billItems: billItems)
        let totalTaxAmount = calculateTaxes(billItems: billItems, taxes: taxes)
        let totalDiscountAmount = calculateDiscounts(subtotal: subtotal, discounts: discounts)
        
        return POSBill(subtotal: subtotal, totalTaxes: totalTaxAmount, totalDiscounts: totalDiscountAmount)
    }
}

fileprivate extension POSBillCalculator {
    func calculateSubtotal(billItems: [POSBillItem]) -> NSDecimalNumber {
        var subtotal = NSDecimalNumber.zero
        for billItem in billItems {
            subtotal = subtotal.adding(billItem.price)
        }
        return subtotal
    }
    
    func calculateTaxes(billItems: [POSBillItem], taxes: [POSTax]) -> NSDecimalNumber {
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
    
    func calculateDiscounts(subtotal: NSDecimalNumber, discounts: [POSDiscount]) -> NSDecimalNumber {
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
