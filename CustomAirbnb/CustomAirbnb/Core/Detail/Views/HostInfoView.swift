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
            hostInfoStack
            Spacer()
            bookButton
        }
    }
}

struct HostInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HostInfoView(listing: dev.listing)
    }
}

extension HostInfoView {
    
    private var hostInfoStack: some View {
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
    
    private var bookButton: some View {
        Button(action: {
            debugPrint("book button pressed")
        }, label: {
            HStack {
                Image(systemName: "calendar")
                Text("Book it")
            }
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
}
