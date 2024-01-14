//
//  BookView.swift
//  CustomAirbnb
//
//  Created by Uri on 14/1/24.
//

import SwiftUI

struct BookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var today = Date.now
    @State private var tomorrow = Date.now.addingTimeInterval(86400)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    DatePicker("Date of arrival", selection: $today, displayedComponents: .date)
                        .padding(.vertical)
                    DatePicker("Date of departure", selection: $tomorrow, displayedComponents: .date)
                        .padding(.vertical)
                    Text("Number of nights")
                        .padding(.vertical)
                    Text("Total price")
                        .padding(.vertical)
                }
                
                    .navigationTitle("Book this listing")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading) {
                            DismissXButton()
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
    
}
