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
    
   // return listingwebsite or return my github
    func returnListingStringForURL() -> String {
        if let listingWebsite = listing.listingURL {
            return listingWebsite
        } else {
            return "https://github.com/raveintospace/CustomAirbnb"
        }
    }
    
    func returnNextDay(currentDay: Date) -> Date {
        let calendar = Calendar.current
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: currentDay) {
            return tomorrow
        }
        return Date()
    }
    
    func calculateDaysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let numberOfDays = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        return numberOfDays.day!
    }

}
