//
//  DescriptionTextFieldView.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct DescriptionTextEditorView: View {
    
    @Binding var descriptionText: String
    @FocusState private var isTextEditorFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                Text("Description")
                    .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
                    .padding(.horizontal)
                    .padding(.top)
                
                Spacer()
                
                if !descriptionText.isEmpty && isTextEditorFocused {
                    Button(action: {
                        descriptionText = ""
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color.theme.accent)
                            .font(.body)
                            .frame(width: 20)
                            .padding(.top)
                            .padding(.horizontal, 25)
                    }
                }
            }
            
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
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isTextEditorFocused ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3))
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    DescriptionTextEditorView(descriptionText: .constant("D"))
}
