//
//  CustomRedButtonStyle.swift
//  CustomAirbnb
//
//  Created by Uri on 11/6/24.
//

import SwiftUI

struct CustomRedButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(Color.theme.airRed)
    }
}

extension View {
    func customRedButtonStyle() -> some View {
        modifier(CustomRedButtonStyle())
    }
}
