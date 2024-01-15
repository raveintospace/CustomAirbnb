//
//  BookView.swift
//  CustomAirbnb
//
//  Created by Uri on 14/1/24.
//

import SwiftUI

struct BookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: DetailViewModel
    
    @State private var arrivalDate = Date.now
    @State private var departureDate = Date.now.addingTimeInterval(86400)
    @State private var numberOfNights: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        arrivalDatePicker
                        RedDivider()
                        departureDatePicker
                        RedDivider()
                        nightsHStack
                        RedDivider()
                        priceHStack
                        RedDivider()
                        
                        requestBookButton
                    }
                    .foregroundStyle(Color.theme.accent)
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

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(viewModel: DetailViewModel(listing: dev.listing))
    }
}

extension BookView {
    
    private var arrivalDatePicker: some View {
        DatePicker("Date of arrival",
                   selection: $arrivalDate,
                   in: Date()...,
                   displayedComponents: .date)
            .padding()
    }
    
    private var departureDatePicker: some View {
        DatePicker("Date of departure",
                   selection: $departureDate,
                   in: viewModel.returnNextDay(currentDay: arrivalDate)...,
                   displayedComponents: .date)
            .padding()
    }
    
    private var nightsHStack: some View {
        HStack {
            Text("Number of nights")
            Spacer()
            Text("\(viewModel.calculateDaysBetweenDates(startDate: arrivalDate, endDate: departureDate))")
                .bold()
        }
        .padding()
    }
    
    private var priceHStack: some View {
        HStack {
            Text("Total price")
            Spacer()
            Text("450 €")
                .bold()
        }
        .padding()
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
        .padding()
    }
    
}
