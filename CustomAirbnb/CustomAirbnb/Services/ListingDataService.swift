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
    @Published var destination: String = "" {
        didSet {
            let apiCityName = convertToAPICityName(displayCityName: destination)
            getListings(city: apiCityName)
        }
    }
    
    // exclusive cancellable for getListings
    var listingSubscription: AnyCancellable?
    
    init() {
        getListings(city: "Barcelona")
    }
    
    func getListings(city: String) {
        guard let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/air-bnb-listings/records?limit=40&refine=room_type%3A%22Entire%20home%2Fapt%22&refine=city%3A%22\(encodedCity)%22") else { return }
        
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
    
    func convertToAPICityName(displayCityName: String) -> String {
        switch displayCityName {
        case "Rome":
            return "Roma"
        default:
            return displayCityName
        }
    }
}
