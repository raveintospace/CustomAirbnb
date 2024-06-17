//
//  String.swift
//  CustomAirbnb
//
//  Created by Uri on 17/6/24.
//

import Foundation

func isGreaterThanOne(_ value: String) -> Bool {
    if let intValue = Int(value), intValue > 0 {
        return true
    }
    return false
}
