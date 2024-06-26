//
//  TitleTextFieldView.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct TitleTextFieldView: View {
    
    @Binding var listingTitle: String
    @FocusState var isTitleTextFieldFocused: Bool
    
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
                    isTitleTextFieldFocused = editing
                })
                .autocorrectionDisabled()
                .submitLabel(.done)
                .foregroundStyle(Color.theme.accent)
                .padding(.horizontal)
                .padding(.bottom)
                .focused($isTitleTextFieldFocused)
                .onChange(of: listingTitle) {
                    if listingTitle.count > 40 {
                        listingTitle = String(listingTitle.prefix(40))
                    }
                }
            }
            if !listingTitle.isEmpty && isTitleTextFieldFocused {
                UploadThirdViewDeletionButton(text: $listingTitle)
            }
        }
        .focusedStroke(isTitleTextFieldFocused)
        .padding(.horizontal, 10)
    }
}

#Preview {
    TitleTextFieldView(listingTitle: .constant("a"))
}
