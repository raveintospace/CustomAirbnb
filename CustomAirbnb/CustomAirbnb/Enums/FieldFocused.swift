//
//  FieldFocused.swift
//  CustomAirbnb
//
//  Created by Uri on 11/6/24.
//

import Foundation

// Hashable so each case is uniquely identified
enum FieldFocused: Hashable {
    case title
    case description
    case price
    case guests
    case beds
    case bedrooms
    case bathrooms
}
