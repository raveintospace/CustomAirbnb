//
//  SortOption.swift
//  CustomAirbnb
//
//  Created by Uri on 3/2/24.
//

import Foundation
import SwiftUI

enum SortOption: String, CaseIterable {
    case name, nameReversed, price, priceReversed, neighbourhood, neighbourhoodReversed
    
    func displayName() -> some View {
        switch self {
        case .name:
            return HStack(spacing: 4) {
                Text("Name")
                Image(systemName: "chevron.down")
            }
        case .nameReversed:
            return HStack(spacing: 4) {
                Text("Name")
                Image(systemName: "chevron.up")
            }
        case .price:
            return HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
            }
        case .priceReversed:
            return HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.up")
            }
        case .neighbourhood:
            return HStack(spacing: 4) {
                Text("Neighbourhood")
                Image(systemName: "chevron.down")
            }
        case .neighbourhoodReversed:
            return HStack(spacing: 4) {
                Text("Neighbourhood")
                Image(systemName: "chevron.up")
            }
        }
    }
}
