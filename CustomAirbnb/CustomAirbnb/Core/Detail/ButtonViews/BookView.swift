//
//  BookView.swift
//  CustomAirbnb
//
//  Created by Uri on 14/1/24.
//

import SwiftUI

struct BookView: View {
    
    let listing: Listing
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: DetailViewModel
    
    @State private var arrivalDate = Date.now
    @State private var departureDate = Date.now.addingTimeInterval(86400)
    @State private var showBookAlert: Bool = false
    
    // notifies DetailView to activate a book confirmation
    var activateBookRequested: () -> Void
    
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
                .alert(isPresented: $showBookAlert) {
                    Alert(
                        title: Text("Book listing"),
                        message: Text("Do you want to send this book request?"),
                        primaryButton: .default(Text("Confirm")) {
                            dismiss()
                            self.activateBookRequested()
                        },
                        secondaryButton: .cancel()
                    )
                }
                    .navigationTitle("Book this listing")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarLeading) {
                            DismissXButton()
                        }
                    })
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(listing: dev.listing, viewModel: DetailViewModel(listing: dev.listing), activateBookRequested: {})
    }
}

extension BookView {
    
    private var arrivalDatePicker: some View {
        DatePicker("Date of arrival",
                   selection: $viewModel.arrivalDate,
                   in: Date()...,
                   displayedComponents: .date)
            .tint(Color.theme.airRed)
            .padding(10)
    }
    
    private var departureDatePicker: some View {
        DatePicker("Date of departure",
                   selection: $viewModel.departureDate,
                   in: viewModel.returnNextDay(currentDay: arrivalDate)...,
                   displayedComponents: .date)
            .tint(Color.theme.airRed)
            .padding(10)
    }
    
    private var nightsHStack: some View {
        HStack {
            Text("Number of nights")
            Spacer()
            
            Stepper(value: $viewModel.numberOfNights,
                    in: 1...Int.max,
                    label: {
                EmptyView()
            })
            .fixedSize()
            .labelsHidden()
            .padding(.trailing, 10)
            
            Text("\(viewModel.numberOfNights)")
                .bold()
        }
        .padding(10)
    }
    
    private var priceHStack: some View {
        HStack {
            Text("Total price")
            Spacer()
            Text("\(calculateTotalPrice()) €")
                .bold()
        }
        .padding(10)
    }
    
    private var requestBookButton: some View {
        Button(action: {
            showBookAlert = true
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
    
    private func calculateNumberOfNights() -> Int {
        viewModel.calculateDaysBetweenDates(startDate: arrivalDate, endDate: departureDate)
    }
    
    private func calculateTotalPrice() -> Int {
        (viewModel.calculateDaysBetweenDates(startDate: arrivalDate, endDate: departureDate)) * (listing.price ?? 0)
    }
}
