//
//  RoomsHStack.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct RoomsHStack: View {
    @Binding var bedrooms: String
    @FocusState private var isBedroomsFieldFocused: Bool
    
    @Binding var bathrooms: String
    @FocusState private var isBathroomsFieldFocused: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                IntegerVStackWithTextField(inputText: $bedrooms, placeholder: "", title: "Bedrooms").focused($isBedroomsFieldFocused)
                
                if !bedrooms.isEmpty && isBedroomsFieldFocused {
                    UploadThirdViewDeletionButton(text: $bedrooms)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isBedroomsFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
            )
            .padding(.leading)
            .frame(width: UIScreen.main.bounds.width / 2)
            
            HStack {
                IntegerVStackWithTextField(inputText: $bathrooms, placeholder: "", title: "Bathrooms").focused($isBathroomsFieldFocused)
                
                if !bathrooms.isEmpty && isBathroomsFieldFocused {
                    UploadThirdViewDeletionButton(text: $bathrooms)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isBathroomsFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
            )
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width / 2)
        }
    }
}

#Preview {
    RoomsHStack(bedrooms: .constant("500"), bathrooms: .constant("500"))
}
