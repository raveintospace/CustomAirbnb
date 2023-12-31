//
//  DetailView.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import SwiftUI

// intented to deal with @binding management
struct DetailLoadingView: View {
    
    @Binding var listing: Listing?
        
    var body: some View {
        ZStack {
            if let listing = listing {
                DetailView(listing: listing)
            }
        }
    }
}

struct DetailView: View {
    
    // properties for LazyVGrid
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    @StateObject private var viewModel: DetailViewModel
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(listing: listing))
    }
    
    @State private var showReportView: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                    .sheet(isPresented: $showReportView) {
                        ReportView(viewModel: viewModel)
                    }
                
                VStack(alignment: .leading) {
                    ImagesSlider(listing: viewModel.listing)
                    apartmentInfo
                    redDivider
                    HostInfoView(listing: viewModel.listing)
                        .padding()
                    redDivider
                    descriptionTitle
                    ListingDescriptionView(listing: viewModel.listing)
                    redDivider
                    ListingGridView(listing: viewModel.listing)
                    redDivider
                }
            }
            reportButton
                .padding(.top, 5)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(listing: dev.listing)
        }
    }
}

extension DetailView {
    
    private var apartmentInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.listing.name ?? "Name n/a")
                .font(.title)
                .bold()
            if let price = viewModel.listing.price {
                Text("Daily price: \(price) €")
                    .font(.title2)
            } else {
                Text("Price n/a")
                    .font(.title3)
            }
            Text(viewModel.listing.neighbourhood ?? "Neighbourhood n/a")
                .font(.system(size: 15))
                .foregroundStyle(Color.theme.secondaryText)
        }
        .padding()
    }
    
    private var redDivider: some View {
        Divider()
            .overlay(Color.theme.airRed)
    }
    
    private var descriptionTitle: some View {
        Text("Apartment description")
            .font(.title2)
            .bold()
            .foregroundColor(Color.theme.accent)
            .padding(.top, 5)
            .padding(.bottom, -5)
            .padding(.horizontal)
    }
    
    private var reportButton: some View {
        Button(action: {
            showReportView.toggle()
        }, label: {
            HStack {
                Image(systemName: "exclamationmark.shield")
                Text("Report listing")
            }
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
}
