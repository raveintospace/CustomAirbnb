//
//  ListingImageViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 21/12/23.
//

import Foundation
import SwiftUI
import Combine

class ListingImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let listing: Listing
    private let dataService: ListingImageDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(listing: Listing) {
        self.isLoading = true
        self.listing = listing
        self.dataService = ListingImageDataService(listing: listing)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        dataService.$image
            .sink { [weak self] (_) in
                guard let self = self else { return }
                self.isLoading = false
            } receiveValue: { [weak self] (returndImage) in
                guard let self = self else { return }
                self.image = returndImage
            }
            .store(in: &cancellables)
    }
}
