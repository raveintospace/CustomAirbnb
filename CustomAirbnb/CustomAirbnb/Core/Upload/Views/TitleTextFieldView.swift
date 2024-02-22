//
//  TitleTextFieldView.swift
//  CustomAirbnb
//
//  Created by Uri on 22/2/24.
//

import SwiftUI

struct TitleTextFieldView: View {
    
    @Binding var listingTitle: String
    @State private var strokeColor: Color = Color.theme.secondaryText.opacity(0.3)
    
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
                    strokeColor = editing ? Color.theme.accent : Color.theme.secondaryText.opacity(0.3)
                })
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accent)
                .padding(.horizontal)
                .padding(.bottom)
                .onChange(of: listingTitle) {
                    if listingTitle.count > 40 {
                        listingTitle = String(listingTitle.prefix(40))
                    }
                }
            }
            if !listingTitle.isEmpty {
                Button(action: {
                    listingTitle = ""
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
                .stroke(strokeColor)
        )
        .onAppear {
            strokeColor = Color.theme.secondaryText.opacity(0.3)
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    TitleTextFieldView(listingTitle: .constant("a"))
}
