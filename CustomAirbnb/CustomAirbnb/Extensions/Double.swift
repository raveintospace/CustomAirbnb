//
//  Double.swift
//  CustomAirbnb
//
//  Created by Uri on 29/12/23.
//

import Foundation

extension Double {
    /// Convert a Double into a String representation
    /// ```
    /// Convert 1.23456 to "1"
    /// Convert 1.5 to "2"
    /// ```
    func asNumberStringRounded() -> String {
        return String(format: "%.0f", self.rounded())
    }
}
