//
//  ListingStatsView.swift
//  CustomAirbnb
//
//  Created by Uri on 29/12/23.
//

import SwiftUI

struct ListingGridView: View {
    
    let listing: Listing
    
    // properties for LazyVGrid
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    var body: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                capacityStat
                bedStat
                bedroomStat
                bathroomStat
            })
        .padding()
    }
}

struct ListingStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingGridView(listing: dev.listing)
    }
}

extension ListingGridView {
    
    private var capacityStat: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Guests")
                .font(.headline)
                .bold()
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "figure.stand")
                Text("\(listing.accommodates)")
            }
            .font(.system(size: 20))
            .foregroundColor(Color.theme.secondaryText)
        }
    }
    
    private var bedStat: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Beds")
                .font(.headline)
                .bold()
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "bed.double.circle")
                Text("\(listing.beds)")
            }
            .font(.system(size: 20))
            .foregroundColor(Color.theme.secondaryText)
        }
    }
    
    private var bedroomStat: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Bedrooms")
                .font(.headline)
                .bold()
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "door.left.hand.closed")
                Text("\(listing.bedrooms)")
            }
            .font(.system(size: 20))
            .foregroundColor(Color.theme.secondaryText)
        }
    }
    
    private var bathroomStat: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Bathrooms")
                .font(.headline)
                .bold()
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "toilet")
                Text(listing.bathrooms.asNumberStringRounded())
            }
            .font(.system(size: 20))
            .foregroundColor(Color.theme.secondaryText)
        }
    }
}
