//
//  NSDecimalNumberExtension.swift
//  Pods-POSBillCalculator_Example
//
//  Created by Vineet Mrug on 2019-06-11.
//

import Foundation

public extension NSDecimalNumber {
    func currencyFormat() -> NSDecimalNumber {
        let handler = NSDecimalNumberHandler(roundingMode: .plain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        return self.rounding(accordingToBehavior: handler)
    }
    
    func currencyFormatString(locale: Locale? = nil) -> String {
        let currencySymbol = locale?.currencySymbol ?? "$"
        let currencyString = String(format: "%.02f", self.currencyFormat().floatValue)
        return currencySymbol + currencyString
    }
}
