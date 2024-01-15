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
    
   // return listingwebsite or return my github // refactor funcs
    func returnListingStringForURL() -> String {
        if let listingWebsite = listing.listingURL {
            return listingWebsite
        } else {
            return "https://github.com/raveintospace/CustomAirbnb"
        }
    }
    
    func calculateDaysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
    
}
