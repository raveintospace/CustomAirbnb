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
        description: "Cozy and chic apartment in a classified modernist building considered a singular exemple of 19th century architecture in the city, The House of the Snails. Registered in Turisme de Catalunya HUTB - (PHONE NUMBER HIDDEN) It is a space with vintage decor, very cozy with two balconies provide plenty of light and exceptional views. You will be provided with every comfort for up to 5 people, lift, tv, dvd, aacc, wi-fi, washing machine, dishwasher, dressing room, 2 bedrooms and a large living room with two sofas, one bed. It is a space with vintage decor, very welcoming and with two balconies that provide lots of light and exceptional views. Upon your arrival we will provide a city and subway map. Also included are linens and towels. If you come with your baby we can offer you a travel cot and highchair. Also you can ask for a extra cleaning service which is 40€ (2 hours plus clean towels and linen) Let us advise you regarding the cultural&culinary treats; we are a couple used to traveling",
        houseRules: "no rules",
        thumbnailURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=small",
        mediumURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=medium",
        xlPictureURL: "https://a0.muscache.com/im/pictures/8c9873ca-2f7b-498c-a130-ef904128fede.jpg?aki_policy=x_large",
        neighbourhood: "El Poble-sec",
        price: 209,
        hostName: "Francisco",
        hostThumbnailURL: "https://a0.muscache.com/im/users/4101093/profile_pic/1352841808/original.jpg?aki_policy=profile_small", 
        hostURL: "https://www.airbnb.com/users/show/10188615",
        hostListingsCount: 26,
        numberOfReviews: 87,
        reviewScoresRating: 46
    )
}


