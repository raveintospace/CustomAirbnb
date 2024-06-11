//
//  ContinueRedButton.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct ContinueRedButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text("Continue")
                .foregroundStyle(Color.white)
                .bold()
                .frame(maxWidth: .infinity)
                .frame(height: 30)
        })
        .customRedButtonStyle()
        .padding(.horizontal, 30)
    }
}

#Preview {
    ContinueRedButton(action: {})
}
