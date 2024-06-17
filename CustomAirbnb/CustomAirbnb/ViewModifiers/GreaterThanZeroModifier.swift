//
//  GreaterThanZeroModifier.swift
//  CustomAirbnb
//
//  Created by Uri on 17/6/24.
//

import SwiftUI

struct GreaterThanZeroModifier: ViewModifier {
    var value: String
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color(for: value))
    }
    
    private func color(for value: String) -> Color {
            if value.isEmpty {
                return Color.theme.secondaryText.opacity(0.5)
            } else if value.isGreaterThanZero() {
                return Color.theme.secondaryText.opacity(0.5)
            } else {
                return Color.theme.airRed
            }
        }
}

extension View {
    func greaterThanZeroTint(value: String) -> some View {
        self.modifier(GreaterThanZeroModifier(value: value))
    }
}
