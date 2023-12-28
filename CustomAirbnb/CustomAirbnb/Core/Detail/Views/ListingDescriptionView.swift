//
//  ListingDescriptionView.swift
//  CustomAirbnb
//
//  Created by Uri on 28/12/23.
//

import SwiftUI

struct ListingDescriptionView: View {
    
    let listing: Listing
    @State private var showFullDescription: Bool = false
    
    var body: some View {
        ZStack {
            if let listingDescription = listing.description,
               !listingDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(listingDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Show less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .tint(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
    }
}

struct ListingDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDescriptionView(listing: dev.listing)
    }
}
