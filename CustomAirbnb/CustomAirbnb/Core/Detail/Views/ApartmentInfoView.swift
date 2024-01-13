//
//  ApartmentInfoView.swift
//  CustomAirbnb
//
//  Created by Uri on 13/1/24.
//

import SwiftUI

struct ApartmentInfoView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(listing.name ?? "Name n/a")
                .font(.title)
                .bold()
                .foregroundStyle(Color.theme.accent)
                .fixedSize(horizontal: false, vertical: true) // allows multiple text lines
            if let price = listing.price {
                Text("Daily price: \(price) €")
                    .font(.title2)
                    .foregroundStyle(Color.theme.accent)
            } else {
                Text("Price n/a")
                    .font(.title3)
                    .foregroundStyle(Color.theme.accent)
            }
            Text(listing.neighbourhood ?? "Neighbourhood n/a")
                .font(.system(size: 15))
                .foregroundStyle(Color.theme.secondaryText)
        }
        .padding()
    }
}

struct ApartmentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ApartmentInfoView(listing: dev.listing)
            .padding(.horizontal)
    }
}
