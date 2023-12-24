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
        VStack {
            Text(viewModel.listing.name ?? "No name")
            Text(viewModel.listing.hostName ?? "No hostName")
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
