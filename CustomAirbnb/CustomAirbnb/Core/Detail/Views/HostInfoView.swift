//
//  HostInfoView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/12/23.
//

import SwiftUI

struct HostInfoView: View {
    
    let listing: Listing
    
    var body: some View {
        HStack() {
            HostImageView(listing: listing)
            VStack(alignment: .leading) {
                Text(listing.hostName ?? "Name n/a")
                    .bold()
                Image(systemName: "star.fill")
                
                if listing.hostListingsCount == 1 {
                    Text("\(listing.hostListingsCount) listing")
                } else {
                    Text("\(listing.hostListingsCount) listings")
                }
            }
        }
    }
}

struct HostInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HostInfoView(listing: dev.listing)
    }
}
