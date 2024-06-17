//
//  String.swift
//  CustomAirbnb
//
//  Created by Uri on 17/6/24.
//

import Foundation

extension String {
    func isGreaterThanZero() -> Bool {
        if let intValue = Int(self), intValue > 0 {
            return true
        }
        return false
    }
}
