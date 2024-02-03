//
//  SortOption.swift
//  CustomAirbnb
//
//  Created by Uri on 3/2/24.
//

import Foundation

enum SortOption: String, CaseIterable {
    case name, nameReversed, price, priceReversed, neighbourhood, neighbourhoodReversed
    
    func displayName() -> String {
        switch self {
        case .name:
            return "Name ⬇️"
        case .nameReversed:
            return "Name ⬆️"
        case .price:
            return "Price ⬇️"
        case .priceReversed:
            return "Price ⬆️"
        case .neighbourhood:
            return "Neighbourhood ⬇️"
        case .neighbourhoodReversed:
            return "Neighbourhood ⬆️"
        }
    }
}
