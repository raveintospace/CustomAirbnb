//
//  TextFieldWithDeletionButton.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct UploadThirdViewDeletionButton: View {
    
    @Binding var text: String
    
    var body: some View {
        Button(action: {
            text = ""
        }) {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color.theme.accent)
                .font(.body)
                .frame(width: 20)
                .padding()
        }
    }
}

#Preview {
    UploadThirdViewDeletionButton(text: .constant("50"))
}
