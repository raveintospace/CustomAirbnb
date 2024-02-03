//
//  ListingRowView.swift
//  CustomAirbnb
//
//  Created by Uri on 18/12/23.
//

import SwiftUI

struct ListingRowView: View {
    
    let listing: Listing
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .padding(.horizontal, 10)
        .background(
            Color.theme.background.opacity(0.001)  // the whole row is clickable
        )
    }
}

struct ListingRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListingRowView(listing: dev.listing)
    }
}

extension ListingRowView {
    
    private var leftColumn: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(listing.name?.capitalized ?? "Airbnb Property")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(2)
            
            if let price = listing.price {
                Text("Daily price: \(price)€")
                    .font(.subheadline)
                    .foregroundStyle(Color.theme.secondaryText)
            } else {
                Text("Price n/a")
                    .font(.subheadline)
                    .foregroundStyle(Color.theme.secondaryText)
            }
            
            Text(listing.neighbourhood?.capitalized ?? "Neighbourhood n/a")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
    
    private var rightColumn: some View {
        ListingImageView(listing: listing)
            .frame(width: 95, height: 70)
    }
}
