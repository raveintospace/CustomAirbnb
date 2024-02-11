//
//  RedDivider.swift
//  CustomAirbnb
//
//  Created by Uri on 15/1/24.
//

import SwiftUI

struct RedDivider: View {
    
    var body: some View {
        Divider()
            .overlay(Color.theme.airRed)
            .padding(.horizontal, -25)
    }
}

#Preview {
    RedDivider()
}
