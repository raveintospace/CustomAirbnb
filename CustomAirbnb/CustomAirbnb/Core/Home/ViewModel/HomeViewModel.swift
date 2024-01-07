//
//  HomeViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 18/12/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var allListings: [Listing] = []
    
    @Published var searchText: String = ""
    
    private let listingDataService = ListingDataService()
    
    private var cancellables = Set<AnyCancellable>()    // we won't cancel this subscription
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(listingDataService.$allListings)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterListings)
            .sink { [weak self] (returnedListings) in
                guard let self = self else { return }
                self.allListings = returnedListings
            }
            .store(in: &cancellables)
    }
    
    // extracted .map from $searchText
    private func filterListings(text: String, listings: [Listing]) -> [Listing] {
        guard !text.isEmpty else {
            return listings
        }
        
        let lowercasedText = text.lowercased()
        
        return listings.filter { (listing) -> Bool in
            return listing.nameToSearch.lowercased().contains(lowercasedText) ||
            listing.hoodToSearch.lowercased().contains(lowercasedText)
        }
    }
}

