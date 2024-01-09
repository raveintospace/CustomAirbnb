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
    @Published var favoriteListings: [Listing] = []
    
    @Published var searchText: String = ""
    
    private let listingDataService = ListingDataService()
    private let favoritesDataService = FavoritesDataService()
    
    private var cancellables = Set<AnyCancellable>()    // we won't cancel this subscription
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // subscription to listingDataService & searchText
        $searchText
            .combineLatest(listingDataService.$allListings)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterListings)
            .sink { [weak self] (returnedListings) in
                guard let self = self else { return }
                self.allListings = returnedListings
            }
            .store(in: &cancellables)
        
        // subscription to allListings (already filtered with searchText) & favoritesDataService
        $allListings
            .combineLatest(favoritesDataService.$savedEntities)
            .map(mapAllListingsToFavoriteListings)
            .sink { [weak self] (returnedListings) in
                guard let self = self else { return }
                self.favoriteListings = returnedListings
            }
            .store(in: &cancellables)
        
    }
    
    func updateFavorites(listing: Listing) {
        favoritesDataService.updatePortfolio(listing: listing)
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
    
    // extracted .map from $allListings
    private func mapAllListingsToFavoriteListings(allListings: [Listing], favoriteEntities: [FavoriteEntity]) -> [Listing] {
        
        // return nil for listings not included in favs
        allListings
            .compactMap { (listing) -> Listing? in
                guard let entity = favoriteEntities.first(where: { $0.listingID == listing.id }) else {
                    return nil
                }
                return listing
            }
    }
}

