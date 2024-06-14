//
//  RoomsHStack.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct RoomsHStack: View {
    @Binding var bedrooms: String
    @Binding var bathrooms: String
   
    // FocusState.Binding because it is linked to UploadThirdView's @FocusState
    @FocusState.Binding var focusedField: FieldFocused?
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                IntegerVStackWithTextField(inputText: $bedrooms, placeholder: "", title: "Bedrooms")
                    .focused($focusedField, equals: .bedrooms)
                
                if !bedrooms.isEmpty && focusedField == .bedrooms {
                    UploadThirdViewDeletionButton(text: $bedrooms)
                }
            }
            .focusedStroke(focusedField == .bedrooms)
            .padding(.leading)
            .frame(width: UIScreen.main.bounds.width / 2)
            
            HStack {
                IntegerVStackWithTextField(inputText: $bathrooms, placeholder: "", title: "Bathrooms")
                    .focused($focusedField, equals: .bathrooms)
                
                if !bathrooms.isEmpty && focusedField == .bathrooms {
                    UploadThirdViewDeletionButton(text: $bathrooms)
                }
            }
            .focusedStroke(focusedField == .bathrooms)
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width / 2)
        }
    }
}

//#Preview {
//    RoomsHStack(bedrooms: .constant("500"), bathrooms: .constant("500"), focusedField: FocusState<FieldFocused?>.Binding)
//}
