//
//  ListingDataService.swift
//  CustomAirbnb
//
//  Created by Uri on 18/12/23.
//

import Foundation
import Combine

final class ListingDataService {
    
    @Published var allListings: [Listing] = []
    
    // exclusive cancellable for getListings
    var listingSubscription: AnyCancellable?
    
    init() {
        getListings()
    }
    
    func getListings() {
        guard let url = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=40&refine=room_type%3A%22Entire%20home%2Fapt%22&refine=city%3A%22Barcelona%22") else { return }
        
        listingSubscription = NetworkManager.fetch(url: url)
            .decode(type: ListingsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {
                [weak self] (returnedListings) in
                guard let self = self else { return }
                self.allListings = returnedListings.results
                self.listingSubscription?.cancel()
            })
    }
    
}
