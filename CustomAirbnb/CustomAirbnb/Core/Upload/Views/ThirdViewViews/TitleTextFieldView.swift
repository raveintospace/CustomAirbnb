//
//  TitleTextFieldView.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct TitleTextFieldView: View {
    
    @Binding var listingTitle: String
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Title")
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                    .padding(.horizontal)
                    .padding(.top)
                
                TextField("",
                          text: $listingTitle,
                          onEditingChanged: { editing in
                    isTextFieldFocused = editing
                })
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accent)
                .padding(.horizontal)
                .padding(.bottom)
                .focused($isTextFieldFocused)
                .onChange(of: listingTitle) {
                    if listingTitle.count > 40 {
                        listingTitle = String(listingTitle.prefix(40))
                    }
                }
            }
            if !listingTitle.isEmpty && isTextFieldFocused {
                UploadThirdViewDeletionButton(text: $listingTitle)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isTextFieldFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    TitleTextFieldView(listingTitle: .constant("a"))
}
