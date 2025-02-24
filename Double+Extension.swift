

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.1f", self)
    }

    // This extension ensures that the currency format works for Double types
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD" // You can change the currency code here
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

