//
//  IntegerVStackWithTextField.swift
//  CustomAirbnb
//
//  Created by Uri on 24/2/24.
//

import SwiftUI

struct IntegerVStackWithTextField: View {
    
    @Binding var inputText: String
    @FocusState private var isFieldFocused: Bool
    let placeholder: String
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.horizontal)
                .padding(.top)
            
            TextField(placeholder,
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
    }
}

#Preview {
    IntegerVStackWithTextField(inputText: .constant("500"), placeholder: "", title: "Guests")
}
