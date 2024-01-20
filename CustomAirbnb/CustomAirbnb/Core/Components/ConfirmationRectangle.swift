//
//  ConfirmationRectangle.swift
//  CustomAirbnb
//
//  Created by Uri on 20/1/24.
//

import SwiftUI

struct ConfirmationRectangle: View {
    
    let copy: String
    let iconName: String
    
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.green).opacity(0.9)
            .overlay(
                HStack(spacing: 2) {
                    Text(copy)
                    Image(systemName: iconName)
                }
                .foregroundStyle(Color.white)
                .bold()
                .font(.system(size: 18))
            )
    }
}

#Preview {
    ConfirmationRectangle(copy: "Book request sent", iconName: "clock.badge.checkmark")
}
