//
//  DetailViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 24/12/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    
    @Published var listing: Listing
    
    // BookView properties
    @Published var arrivalDate: Date = Date.now
    @Published var departureDate: Date = Date.now.addingTimeInterval(86400) {
        didSet {
            calculateDaysBetweenDates(startDate: arrivalDate, endDate: departureDate)
        }
    }
    @Published var numberOfNights: Int = 1 {
        didSet {
            updateDepartureDate()
        }
    }
    
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
    
    // BookView methods
    func returnNextDay(currentDay: Date) -> Date {
        let calendar = Calendar.current
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: currentDay) {
            return tomorrow
        }
        return Date()
    }
    
    func calculateDaysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let startOfStartDate = calendar.startOfDay(for: startDate)
        let startOfEndDate = calendar.startOfDay(for: endDate)

        let numberOfDays = calendar.dateComponents([.day], from: startOfStartDate, to: startOfEndDate)

        numberOfNights = max(numberOfDays.day!, 0)
        
        return max(numberOfDays.day!, 0)
    }
    
    func updateDepartureDate() {
        departureDate = Calendar.current.date(byAdding: .day, value: numberOfNights, to: arrivalDate) ?? Date.now
    }

}
