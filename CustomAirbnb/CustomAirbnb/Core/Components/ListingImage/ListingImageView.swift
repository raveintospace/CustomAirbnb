//
//  ListingImageView.swift
//  CustomAirbnb
//
//  Created by Uri on 19/12/23.
//

import SwiftUI

struct ListingImageView: View {
    
    @StateObject var viewModel: ListingImageViewModel
    
    init(listing: Listing) {
        _viewModel = StateObject(wrappedValue: ListingImageViewModel(listing: listing))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            } else {
                Image("airlogo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

struct ListingImageView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageView(listing: dev.listing)
    }
}
