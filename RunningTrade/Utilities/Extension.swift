//
//  Extension.swift
//  RunningTrade
//
//  Created by Kevin Harijanto on 16/11/22.
//

import UIKit

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }()
}

extension Array where Element: Hashable {
    func uniqueArrItems() -> [Element] {
        var dictAdded = [Element: Bool]()

        return filter {
            dictAdded.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.uniqueArrItems()
    }
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

extension UIColor {
    static let rtblack = UIColor(red: 0.09, green: 0.11, blue: 0.13, alpha: 1.00)
    static let rtsemiblack = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
    static let rtgray = UIColor(red: 0.18, green: 0.23, blue: 0.28, alpha: 1.00)
    static let rtred = UIColor(red: 0.78, green: 0.20, blue: 0.20, alpha: 1.00)
    static let rtgreen = UIColor(red: 0.00, green: 0.62, blue: 0.06, alpha: 1.00)
    static let rtblue = UIColor(red: 0.00, green: 0.20, blue: 0.40, alpha: 1.00)
    static let rtorange = UIColor(red: 0.97, green: 0.56, blue: 0.12, alpha: 1.00)
}
