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
        ZStack {
            VStack(spacing: 0) {
                XLImageView(listing: listing)
                
                if listing.listingURL != nil {
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .foregroundStyle(Color.theme.airRed)
                        listingWebsiteHStack
                    }
                }
            }
                LottieHeartView(filename: "hearts",
                                loopMode: .playOnce,
                                animationSpeed: 9.0)
                .frame(width: 5, height: 5)
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

