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
                guestsPriceVStack
                
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
                bedsPriceVStack
                
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

extension GuestsBedsHStack {
    
    private var guestsPriceVStack: some View {
        VStack(alignment: .leading) {
            Text("Guests")
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.horizontal)
                .padding(.top)
            
            TextField("",
                      text: $guests,
                      onEditingChanged: { editing in
                isGuestsFieldFocused = editing
            })
            .autocorrectionDisabled()
            .keyboardType(.numberPad)
            .foregroundStyle(Color.theme.accent)
            .padding(.horizontal)
            .padding(.bottom)
            .focused($isGuestsFieldFocused)
            .onChange(of: guests) {
                if guests.count > 3 {
                    guests = String(guests.prefix(3))
                }
            }
        }
    }
    
    private var bedsPriceVStack: some View {
        VStack(alignment: .leading) {
            Text("Beds")
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                .padding(.horizontal)
                .padding(.top)
            
            TextField("",
                      text: $beds,
                      onEditingChanged: { editing in
                isBedsFieldFocused = editing
            })
            .autocorrectionDisabled()
            .keyboardType(.numberPad)
            .foregroundStyle(Color.theme.accent)
            .padding(.horizontal)
            .padding(.bottom)
            .focused($isBedsFieldFocused)
            .onChange(of: beds) {
                if beds.count > 3 {
                    beds = String(beds.prefix(3))
                }
            }
        }
    }
}
