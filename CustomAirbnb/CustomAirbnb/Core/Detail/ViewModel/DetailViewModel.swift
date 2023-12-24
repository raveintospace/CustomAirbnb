//
//  DetailViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
    }
}
