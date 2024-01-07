//
//  CircleButtonAnimationView.swift
//  CustomAirbnb
//
//  Created by Uri on 7/1/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0: 1.0)
            .transaction { transaction in
                transaction.animation = animate ? .easeOut(duration: 0.5) : nil
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
