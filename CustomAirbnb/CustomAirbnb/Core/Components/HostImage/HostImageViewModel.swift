//
//  HostImageViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 27/12/23.
//

import Foundation
import SwiftUI
import Combine

final class HostImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    private let listing: Listing
    private let dataService: HostImageDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(listing: Listing) {
        self.listing = listing
        self.dataService = HostImageDataService(listing: listing)
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { (_) in
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self else { return }
                self.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
