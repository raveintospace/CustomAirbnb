//
//  FullScreenImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 26/1/24.
//

import SwiftUI

struct FullScreenImageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    FullScreenImageView()
}
