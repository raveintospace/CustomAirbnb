//
//  SearchBarView.swift
//  CustomAirbnb
//
//  Created by Uri on 7/1/24.
//

import SwiftUI

struct SearchBarView: View {
    
    // Binding instead of State so searchText can bind to any string in our app
    // Where we put a SearchBarView, we will bind a string to it
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or neighbourhood", text: $searchText)
                .font(.system(size: 16))
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled()
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)  // easier for users to tap
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.hideKeyboard()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.25),
                        radius: 10, x: 0, y:0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
