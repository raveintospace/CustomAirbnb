//
//  IntegerFields.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct PriceTextField: View {
    
    @Binding var price: String
    @FocusState private var isPriceFieldFocused: Bool
    @FocusState private var isCurrencyPickerFocused: Bool
    @State private var strokeColor: Color = Color.theme.secondaryText.opacity(0.3)
    @State private var selectedCurrency: String = "EUR"
    
    private let currencies: [String] = ["AUD", "CAD", "EUR", "GBP", "USD"]
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                textPriceVStack
                
                if !price.isEmpty && isPriceFieldFocused {
                    deletionButton
                }
            }
            .frame(width: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isPriceFieldFocused ? Color.theme.accent : strokeColor)
            )
            .padding(.leading, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Currency")
                        .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                        .padding(.top)
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        ForEach(currencies, id: \.self) { currency in
                            Text(currency)
                        }
                    }
                    .focused($isCurrencyPickerFocused)
                }
            }
            .frame(width: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isCurrencyPickerFocused ? Color.theme.accent : strokeColor)
            )
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    PriceTextField(price: .constant("50"))
}

extension PriceTextField {
    
    private var textPriceVStack: some View {
        VStack(alignment: .leading) {
            Text("Daily price")
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.horizontal)
                .padding(.top)
            
            TextField("",
                      text: $price,
                      onEditingChanged: { editing in
                isPriceFieldFocused = editing
            })
            .autocorrectionDisabled()
            .keyboardType(.numberPad)
            .foregroundStyle(Color.theme.accent)
            .padding(.horizontal)
            .padding(.bottom)
            .focused($isPriceFieldFocused)
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
