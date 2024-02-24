//
//  View.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

extension View {
    func focusedStroke(_ isFocused: Bool) -> some View {
        self.overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(isFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
        )
    }
}
