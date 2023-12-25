//
//  PreviewProvider.swift
//  CustomAirbnb
//
//  Created by Uri on 18/12/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }  // instance can only be initialized from class DeveloperPreview
    
    let listing = Listing(
        id: "15386249",
        listingURL: "https://www.airbnb.com/rooms/15386249",
        name: "Tapioles Triplex Apartment",
        summary: "Spacious and comfortable triplex located in the neighborhood of Poble Sec, between Plaça Espanya and the Port of Barcelona. It has 125m2 composed of 4 bedrooms, 2 bathrooms, large kitchen and spacious living room with a sofa and a large dining table. Its maximum capacity is 10 people. Apartment for tourist use with license number: HUTB-001800.",
        houseRules: "no rules",
        thumbnailURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=small",
        mediumURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=medium",
        xlPictureURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=x_large",
        neighbourhood: "El Poble-sec",
        price: 209,
        hostName: "Francisco",
        hostSince: "2013-05-22",
        hostThumbnailURL: "https://a0.muscache.com/im/pictures/b8e6d554-7efa-48eb-98d0-5926714fe335.jpg?aki_policy=profile_small", 
        hostURL: "https://www.airbnb.com/users/show/10188615"
    )
}


