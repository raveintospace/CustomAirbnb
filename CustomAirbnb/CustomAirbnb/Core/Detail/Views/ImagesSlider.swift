//
//  ImagesSlider.swift
//  CustomAirbnb
//
//  Created by Uri on 25/12/23.
//

import SwiftUI

struct ImagesSlider: View {
    
    let listing: Listing
    @Binding var showHearts: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            XLImageView(listing: listing)
                .overlay {
                    if showHearts {
                        LottieView(name: "hearts", loopMode: .playOnce, animationSpeed: 1.5)
                    }
                }
            
            if listing.listingURL != nil {
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
        ImagesSlider(listing: dev.listing, showHearts: .constant(true))
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

