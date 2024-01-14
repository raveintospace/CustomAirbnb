//
//  HostInfoView.swift
//  CustomAirbnb
//
//  Created by Uri on 27/12/23.
//

import SwiftUI

struct HostInfoView: View {
    
    let listing: Listing
    
    // notifies DetailView to activate a thanks view
    var activateBookView: () -> Void
    
    var body: some View {
        HStack() {
            HostImageView(listing: listing)
            hostInfoStack
            Spacer()
            bookButton
        }
        .padding()
    }
}

struct HostInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HostInfoView(listing: dev.listing, activateBookView: {})
    }
}

extension HostInfoView {
    
    private var hostInfoStack: some View {
        VStack(alignment: .leading) {
            Text(listing.hostName ?? "Name n/a")
                .bold()
                .foregroundStyle(Color.theme.accent)
            HStack(spacing: 3) {
                starsStack
                totalReviews
                    .foregroundStyle(Color.theme.secondaryText)
            }
            
            if listing.hostListingsCount == 1 {
                Text("\(listing.hostListingsCount) listing")
                    .foregroundStyle(Color.theme.secondaryText)
            } else {
                Text("\(listing.hostListingsCount) listings")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
    
    private var starsStack: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .aspectRatio(contentMode: .fit)
            }
        }
        
        return stars.overlay(
            GeometryReader { g in
                let width = listing.starsWidth / 5 * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundStyle(.yellow)
                }
            }
                .mask(stars)
        )
        .foregroundStyle(Color.theme.secondaryText.opacity(0.3))
    }
    
    private var totalReviews: some View {
        if let reviewsInTotal = listing.numberOfReviews {
            Text("(\(reviewsInTotal))")
                .font(.caption2)
        } else {
            Text("(0)")
                .font(.caption2)
        }
    }
    
    private var bookButton: some View {
        Button(action: {
            self.activateBookView()
        }, label: {
            HStack {
                Image(systemName: "calendar")
                Text("Book it")
            }
            .foregroundStyle(Color.white)
        })
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(Color.theme.airRed)
    }
}
