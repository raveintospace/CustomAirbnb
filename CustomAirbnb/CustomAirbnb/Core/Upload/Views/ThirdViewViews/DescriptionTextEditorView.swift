//
//  DescriptionTextFieldView.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct DescriptionTextEditorView: View {
    
    @Binding var descriptionText: String
    @FocusState var isTextEditorFocused: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Description")
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                    .padding(.horizontal)
                    .padding(.top)
                
                TextEditor(text: $descriptionText)
                    .frame(height: 120)
                    .autocorrectionDisabled()
                    .foregroundStyle(Color.theme.accent)
                    .scrollContentBackground(.hidden)   // avoids a default gray color
                    .background(Color.theme.background) // avoids a default gray color
                    .padding(.horizontal, 10)
                    .focused($isTextEditorFocused)
                    .onChange(of: descriptionText) {
                        if descriptionText.count > 3000 {
                            descriptionText = String(descriptionText.prefix(3000))
                        }
                    }
            }
            
            if !descriptionText.isEmpty && isTextEditorFocused {
                UploadThirdViewDeletionButton(text: $descriptionText)
            }
        }
        .focusedStroke(isTextEditorFocused)
        .padding(.horizontal, 10)
    }
}

#Preview {
    DescriptionTextEditorView(descriptionText: .constant("D"))
}
