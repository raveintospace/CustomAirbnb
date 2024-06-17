//
//  IntegerFields.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct PriceHStack: View {
    
    @Binding var price: String
    @FocusState var isPriceFieldFocused: Bool
    @State private var selectedCurrency: String = "EUR"
    
    private let currencies: [String] = ["AUD", "CAD", "EUR", "GBP", "USD"]
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                textPriceVStack
                
                if !price.isEmpty && isPriceFieldFocused {
                    UploadThirdViewDeletionButton(text: $price)
                }
            }
            .focusedStroke(isPriceFieldFocused)
            .padding(.leading)
            .frame(width: UIScreen.main.bounds.width / 2)
            
            HStack {
                currencyVStack
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.secondaryText.opacity(0.3))
            )
            .padding(.trailing)
            .frame(width: UIScreen.main.bounds.width / 2)
        }
        
    }
}

#Preview {
    PriceHStack(price: .constant("50"))
}

extension PriceHStack {
    
    private var textPriceVStack: some View {
        VStack(alignment: .leading) {
            Text("Daily price")
                .foregroundStyle(isGreaterThanOne(price) ? Color.theme.secondaryText.opacity(0.5) : Color.theme.airRed)
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
    
    private var currencyVStack: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Currency")
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.top)
                .padding(.leading, 10)
                Spacer()
            }
            
            HStack {
                Picker("Currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .padding(.bottom, 5)
                Spacer()
            }
        }
    }
}
