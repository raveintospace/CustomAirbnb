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
                .lineLimit(2)
            
            Text(listing.neighbourhood?.capitalized ?? "Neighbourhood n/a")
                .font(.caption)
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        ListingImageView(listing: listing)
            .frame(width: 90, height: 70)
    }
}
