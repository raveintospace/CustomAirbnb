//
//  DetailViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var listing: Listing
    
    let reportReasons = ReportReason.stub
    
    init(listing: Listing) {
        self.listing = listing
    }
}
