//
//  ImagesSlider.swift
//  CustomAirbnb
//
//  Created by Uri on 25/12/23.
//

import SwiftUI

struct ImagesSlider: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundStyle(Color.green)
                .frame(height: 400)
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 10
                    )
                )
            // if host info is available
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(Color.theme.airRed)
                HStack {
                    Text(listing.id)
                        .foregroundStyle(Color.theme.accent)
                    Spacer()
                }
                .padding(.horizontal, 15)
            }
        }
    }
}

struct ImagesSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImagesSlider(listing: dev.listing)
    }
}
