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
            .padding(.horizontal)
    }
}

extension HostInfoView {
    
    private var hostInfoStack: some View {
        VStack(alignment: .leading) {
            Text(listing.hostName ?? "Name n/a")
                .bold()
            starsStack
            
            if listing.hostListingsCount == 1 {
                Text("\(listing.hostListingsCount) listing")
            } else {
                Text("\(listing.hostListingsCount) listings")
            }
        }
    }
    
    private var starsStack: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<5, id: \.self) { _ in
                Image(systemName: "star.fill")
                    //.resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        
        return stars.overlay(
            GeometryReader { g in
                let width = 3 / CGFloat(5) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
                .mask(stars)
        )
        .foregroundColor(.gray)
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
