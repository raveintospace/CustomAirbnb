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
        Image("dummyPicSlider1")
            .resizable()
            .scaledToFit()
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    FullScreenImageView()
}
