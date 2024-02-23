//
//  GuestsTextField.swift
//  CustomAirbnb
//
//  Created by Uri on 23/2/24.
//

import SwiftUI

struct ListingIntegerTextField: View {
    
    @Binding var inputText: String
    @FocusState private var isFieldFocused: Bool
    var fieldText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fieldText)
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                    .padding(.horizontal)
                    .padding(.top)
                
                TextField("",
                          text: $inputText,
                          onEditingChanged: { editing in
                    isFieldFocused = editing
                })
                .autocorrectionDisabled()
                .keyboardType(.numberPad)
                .foregroundStyle(Color.theme.accent)
                .padding(.horizontal)
                .padding(.bottom)
                .focused($isFieldFocused)
                .onChange(of: inputText) {
                    if inputText.count > 3 {
                        inputText = String(inputText.prefix(3))
                    }
                }
            }
            
            if !inputText.isEmpty && isFieldFocused {
                Button(action: {
                    inputText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .font(.body)
                        .frame(width: 40)
                        .padding()
                }
            }
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
        )
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width/2)
    }
}

#Preview {
    ListingIntegerTextField(inputText: .constant("3"), fieldText: "Guests")
}
