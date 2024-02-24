//
//  GuestsBedsHStack.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct GuestsBedsHStack: View {
    
    @Binding var guests: String
    @FocusState private var isGuestsFieldFocused: Bool
    
    @Binding var beds: String
    @FocusState private var isBedsFieldFocused: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                IntegerVStackWithTextField(inputText: $guests, placeholder: "", title: "Guests").focused($isGuestsFieldFocused)
                
                if !guests.isEmpty && isGuestsFieldFocused {
                    UploadThirdViewDeletionButton(text: $guests)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isGuestsFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
            )
            .padding(.leading)
            .frame(width: UIScreen.main.bounds.width / 2)
            
            HStack {
                IntegerVStackWithTextField(inputText: $beds, placeholder: "", title: "Beds").focused($isBedsFieldFocused)
                
                if !beds.isEmpty && isBedsFieldFocused {
                    UploadThirdViewDeletionButton(text: $beds)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isBedsFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
            )
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width / 2)
        }
    }
}

#Preview {
    GuestsBedsHStack(guests: .constant("300"), beds: .constant("300"))
}
