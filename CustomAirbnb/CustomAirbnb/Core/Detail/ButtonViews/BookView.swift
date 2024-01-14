//
//  BookView.swift
//  CustomAirbnb
//
//  Created by Uri on 14/1/24.
//

import SwiftUI

struct BookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                    .navigationTitle("Book this listing")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading) {
                            dismissButton
                        }
                    })
            }
        }
    }
}

#Preview {
    BookView()
}

extension BookView {
    
    private var dismissButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}
