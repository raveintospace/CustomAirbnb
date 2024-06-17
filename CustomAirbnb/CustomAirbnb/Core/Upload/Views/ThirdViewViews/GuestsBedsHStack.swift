//
//  GuestsBedsHStack.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct GuestsBedsHStack: View {
    
    @Binding var guests: String
    @Binding var beds: String
    
    // FocusState.Binding because it is linked to UploadThirdView's @FocusState
    @FocusState.Binding var focusedField: FieldFocused?
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                IntegerVStackWithTextField(inputText: $guests, placeholder: "", title: "Guests")
                    .focused($focusedField, equals: .guests)
                    .greaterThanZeroTint(value: guests)
                    
                if !guests.isEmpty && focusedField == .guests {
                    UploadThirdViewDeletionButton(text: $guests)
                }
            }
            .focusedStroke(focusedField == .guests)
            .padding(.leading)
            .frame(width: UIScreen.main.bounds.width / 2)
            
            HStack {
                IntegerVStackWithTextField(inputText: $beds, placeholder: "", title: "Beds")
                    .focused($focusedField, equals: .beds)
                    .greaterThanZeroTint(value: beds)
                
                if !beds.isEmpty && focusedField == .beds {
                    UploadThirdViewDeletionButton(text: $beds)
                }
            }
            .focusedStroke(focusedField == .beds)
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width / 2)
        }
    }
}
