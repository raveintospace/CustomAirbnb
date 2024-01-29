//
//  ImagesSlider.swift
//  CustomAirbnb
//
//  Created by Uri on 25/12/23.
//

import SwiftUI

struct ImagesSlider: View {
    
    let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
    }
    
    var body: some View {
        VStack(spacing: 0) {
            XLImageView(listing: listing)
            
            if let listingWebsite = listing.listingURL {
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundStyle(Color.theme.airRed)
                    listingWebsiteHStack
                }
            }
        }
    }
}

struct ImagesSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImagesSlider(listing: dev.listing)
    }
}

extension ImagesSlider {

    private var listingWebsiteHStack: some View {
        HStack {
            Image(systemName: "house")
            Link("Listing Website", destination: URL(string: listing.listingURL!)!)
                .bold()
            Spacer()
        }
        .foregroundStyle(Color.white)
        .padding(.horizontal, 15)
    }
}

