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
    
    @StateObject private var viewModel: DetailViewModel
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(listing: listing))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImagesSlider(listing: viewModel.listing)
                aptInfo
                redDivider
                HostInfoView(listing: viewModel.listing)
                    .padding()
                redDivider
                descriptionTitle
                ListingDescriptionView(listing: viewModel.listing)
            }
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
    
    private var aptInfo: some View {
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
}
