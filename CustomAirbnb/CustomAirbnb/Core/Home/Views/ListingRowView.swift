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
        Text(listing.name ?? "Airbnb Property")
            .font(.headline)
            .padding(.leading, 6)
            .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        ListingImageView(listing: listing)
            .frame(width: 90, height: 70)
    }
}
