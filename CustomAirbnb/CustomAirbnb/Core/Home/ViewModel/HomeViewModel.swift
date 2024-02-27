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
    
    @Published var sortOption: SortOption = .price
    
    @Published var searchText: String = ""
    @Published var destination: String = "" {
        didSet {
            destinationPublisher.send(destination)
        }
    }
    
    // MARK: - Filters
    @Published var showFiltersView: Bool = false
    
    @Published var guestsFilter: Int = 1 {
        didSet {
            updateListingsWithAllFilters()
        }
    }
    
    @Published var bedroomsFilter: Int = 1 {
        didSet {
            updateListingsWithAllFilters()
        }
    }
    
    @Published var bedsFilter: Int = 1 {
        didSet {
            updateListingsWithAllFilters()
        }
    }
    
    @Published var bathroomsFilter: Double = 1 {
        didSet {
            updateListingsWithAllFilters()
        }
    }
    
    @Published var priceFilter: Int = 2000 {
        didSet {
            updateListingsWithAllFilters()
        }
    }
    
    @Published var showUploadThanks: Bool = false
    
    // DataServices
    private let listingDataService = ListingDataService()
    private let favoritesDataService = FavoritesDataService()
    
    // sinks HomeViewModel destination to ListingDataService destination
    private let destinationPublisher = PassthroughSubject<String, Never>()
    
    private var cancellables = Set<AnyCancellable>()    // we won't cancel this subscription
    
    let cities = City.stub
    
    init() {
        addSubscribers()
    }
    
    // MARK: - Methods
    func addSubscribers() {
        
        // subscription to listingDataService, searchText & sortOption
        $searchText
            .combineLatest(listingDataService.$allListings, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortListings)
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
        
        // subscriptions to grid filters
        $guestsFilter
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateListingsWithAllFilters()
            }
            .store(in: &cancellables)
        
        $bedroomsFilter
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateListingsWithAllFilters()
            }
            .store(in: &cancellables)
        
        $bedsFilter
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateListingsWithAllFilters()
            }
            .store(in: &cancellables)
        
        $bathroomsFilter
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateListingsWithAllFilters()
            }
            .store(in: &cancellables)
        
        $priceFilter
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.updateListingsWithAllFilters()
            }
            .store(in: &cancellables)
        
        // subscription to destinationPublisher
        destinationPublisher
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] (destination) in
                guard let self = self else { return }
                self.listingDataService.destination = destination
            }
            .store(in: &cancellables)
    }
    
    func updateFavorites(listing: Listing) {
        favoritesDataService.updatePortfolio(listing: listing)
    }
    
    func setDesignForHeartFav(listing: Listing) -> Bool {
        if favoriteListings.contains(where: { $0.id == listing.id }) {
            return true
        } else {
            return false
        }
    }
    
    func resetFiltersValues() {
        guestsFilter = 1
        bedroomsFilter = 1
        bedsFilter = 1
        bathroomsFilter = 1
        priceFilter = 2000
    }
    
// MARK: - Extracted methods
    
    // filter using searchText & grid filters
    private func filterListings(text: String, listings: [Listing]) -> [Listing] {
        guard !text.isEmpty else {
            return applyGridFilters(listings)
        }
        
        let lowercasedText = text.lowercased()
        
        let filteredListings = applyGridFilters(listings)
        
        return filteredListings.filter { (listing) -> Bool in
            return listing.nameToSearch.lowercased().contains(lowercasedText) ||
            listing.hoodToSearch.lowercased().contains(lowercasedText) ||
            listing.descriptionToSearch.lowercased().contains(lowercasedText)
        }
    }
    
    // sort using SortOption
    // inout -> get and return the same array after being sorted
    private func sortListings(sort: SortOption, listings: inout [Listing]) {
        switch sort {
        case .name:
            listings.sort(by: { $0.nameToSearch < $1.nameToSearch })
        case .nameReversed:
            listings.sort(by: { $0.nameToSearch > $1.nameToSearch })
        case .price:
            listings.sort(by: { $0.priceToSearch < $1.priceToSearch })
        case .priceReversed:
            listings.sort(by: { $0.priceToSearch > $1.priceToSearch })
        case .neighbourhood:
            listings.sort(by: { $0.hoodToSearch < $1.hoodToSearch })
        case .neighbourhoodReversed:
            listings.sort(by: { $0.hoodToSearch > $1.hoodToSearch })
        }
    }
    
    // filter listings by searchText & gridFilters + sort them
    private func updateListingsWithAllFilters() {
        var updatedListings = filterListings(text: searchText, listings: listingDataService.allListings)
        sortListings(sort: sortOption, listings: &updatedListings)
        allListings = updatedListings
    }
    
    // MARK: - Grid methods
    private func applyGridFilters(_ listings: [Listing]) -> [Listing] {
        return applyPriceFilter(applyBathroomsFilter(applyBedsFilter(applyBedroomsFilter(applyGuestsFilter(listings)))))
    }

    private func applyGuestsFilter(_ listings: [Listing]) -> [Listing] {
        guard guestsFilter >= 1 else {
            return listings
        }
        
        return listings.filter( { $0.guests >= guestsFilter })
    }
    
    private func applyBedroomsFilter(_ listings: [Listing]) -> [Listing] {
        guard bedroomsFilter >= 1 else {
            return listings
        }
        
        return listings.filter( { $0.bedrooms >= bedroomsFilter })
    }
    
    private func applyBedsFilter(_ listings: [Listing]) -> [Listing] {
        guard bedsFilter >= 1 else {
            return listings
        }
        
        return listings.filter( { $0.beds >= bedsFilter })
    }
    
    private func applyBathroomsFilter(_ listings: [Listing]) -> [Listing] {
        guard bathroomsFilter >= 1 else {
            return listings
        }
        
        return listings.filter( { $0.bathrooms >= bathroomsFilter })
    }
    
    private func applyPriceFilter(_ listings: [Listing]) -> [Listing] {
        guard priceFilter <= 2000 else {
            return listings
        }
        
        return listings.filter( { $0.priceToSearch <= priceFilter })
    }
    
    // extracted .map from $searchText
    private func filterAndSortListings(text: String, listings: [Listing], sort: SortOption) -> [Listing] {
        var updatedListing = filterListings(text: text, listings: listings)
        sortListings(sort: sort, listings: &updatedListing)
        return updatedListing
    }
    
    // extracted .map from $allListings
    private func mapAllListingsToFavoriteListings(allListings: [Listing], favoriteEntities: [FavoriteEntity]) -> [Listing] {
        
        // return nil for listings not included in favs
        allListings
            .compactMap { (listing) -> Listing? in
                guard favoriteEntities.first(where: { $0.listingID == listing.id }) != nil else {
                    return nil
                }
                return listing
            }
    }
}
