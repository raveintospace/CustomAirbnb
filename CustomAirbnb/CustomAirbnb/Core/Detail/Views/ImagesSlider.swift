//
//  ImagesSlider.swift
//  CustomAirbnb
//
//  Created by Uri on 25/12/23.
//

import SwiftUI

struct ImagesSlider: View {
    
    let listing: Listing
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 400)
                .padding(.horizontal, 1)
                .cornerRadius(10)
            
            Text(listing.id)
        }
    }
}

struct ImagesSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImagesSlider(listing: dev.listing)
    }
}
