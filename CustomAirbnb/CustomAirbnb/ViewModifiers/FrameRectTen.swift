//
//  FrameRectTen.swift
//  CustomAirbnb
//
//  Created by Uri on 29/1/24.
//

import SwiftUI

struct FrameRectTen: ViewModifier {
    var height: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(height: height)
            .clipShape(
                .rect(
                    topLeadingRadius: 10,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 10
                )
            )
    }
}

extension View {
    func frameRectTenShape(height: CGFloat) -> some View {
        modifier(FrameRectTen(height: height))
    }
}
