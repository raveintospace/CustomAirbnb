//
//  TopBarLeadingArrow.swift
//  CustomAirbnb
//
//  Created by Uri on 6/2/24.
//

import SwiftUI

struct TopBarLeadingArrow: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "arrow.left")
        })
        .tint(Color.theme.accent)
    }
}

#Preview {
    TopBarLeadingArrow()
}
