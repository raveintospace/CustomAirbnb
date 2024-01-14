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
                VStack {
                    VStack {
                        DatePicker("Date of arrival", selection: $today, displayedComponents: .date)
                            .padding(.vertical)
                        //redDivider
                        DatePicker("Date of departure", selection: $tomorrow, displayedComponents: .date)
                            .padding(.vertical)
                        nightsHStack
                        priceHStack
                        
                        requestBookButton
                    }
                    .foregroundStyle(Color.theme.accent)
                    .padding(.horizontal)
                    Spacer()
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
    
    private var nightsHStack: some View {
        HStack {
            Text("Number of nights")
            Spacer()
            Text("5")
                .bold()
        }
        .padding(.vertical)
    }
    
    private var priceHStack: some View {
        HStack {
            Text("Total price")
            Spacer()
            Text("450 €")
                .bold()
        }
        .padding(.vertical)
    }
    
    private var requestBookButton: some View {
        Button(action: {
            debugPrint("request button pressed")
        }, label: {
            HStack {
                Image(systemName: "paperplane")
                Text("Send book request")
            }
            .foregroundStyle(Color.white)
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
    
}
