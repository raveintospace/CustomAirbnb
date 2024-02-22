//
//  IntegerFields.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct PriceTextField: View {
    
    @Binding var price: String
    @FocusState private var isTextFieldFocused: Bool
    @State private var strokeColor: Color = Color.theme.secondaryText.opacity(0.3)
    
    var body: some View {
        HStack {
            textPriceVStack
            
            if !price.isEmpty && isTextFieldFocused {
                deletionButton
            }
        }
        .frame(width: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isTextFieldFocused ? Color.theme.accent : strokeColor)
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    PriceTextField(price: .constant("50"))
}

extension PriceTextField {
    
    private var textPriceVStack: some View {
        VStack(alignment: .leading) {
            Text("Daily price (€)")
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.horizontal)
                .padding(.top)
            
            TextField("",
                      text: $price,
                      onEditingChanged: { editing in
                isTextFieldFocused = editing
            })
            .autocorrectionDisabled()
            .keyboardType(.numberPad)
            .foregroundStyle(Color.theme.accent)
            .padding(.horizontal)
            .padding(.bottom)
            .focused($isTextFieldFocused)
            .onChange(of: price) {
                if price.count > 7 {
                    price = String(price.prefix(7))
                }
            }
        }
    }
    
    private var deletionButton: some View {
        Button(action: {
            price = ""
        }) {
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(Color.theme.accent)
                .font(.body)
                .frame(width: 20)
                .padding()
        }
    }
}
