//
//  HomeViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 18/12/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allListings: [Listing] = []
    
    private let listingDataService = ListingDataService()
    
    private var cancellables = Set<AnyCancellable>()    // we won't cancel this subscription
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        listingDataService.$allListings
            .sink { [weak self] (returnedListings) in
                guard let self = self else { return }
                self.allListings = returnedListings
            }
            .store(in: &cancellables)        
    }
}
