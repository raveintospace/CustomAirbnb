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
            renderListingImage()
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

struct ListingImageView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageView(listing: dev.listing)
    }
}

extension ListingImageView {
    
    private func renderListingImage() -> Image {
        if let image = viewModel.image {
            return Image(uiImage: image)
        } else {
            let usePlaceholder = Bool.random()
            if usePlaceholder {
                return Image("airlogo")
            } else {
                let assetImages = ["midlist1", "midlist2", "midlist3", "midlist4", "midlist5", "midlist6", "midlist7", "midlist8"]
                let randomImageName = assetImages.randomElement() ?? "hostPlaceholder"
                return Image(randomImageName)
            }
        }
    }
}
