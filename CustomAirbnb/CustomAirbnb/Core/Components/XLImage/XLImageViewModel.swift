//
//  XLImageViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 27/1/24.
//

import Foundation
import SwiftUI
import Combine

final class XLImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    private let listing: Listing
    private let dataService: XLImageDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(listing: Listing) {
        self.listing = listing
        self.dataService = XLImageDataService(listing: listing)
        addSubscribers()
    }
    
    private func addSubscribers() {
        
        dataService.$image
            .sink { (_) in
            } receiveValue: { [weak self] (returndImage) in
                guard let self = self else { return }
                self.image = returndImage
            }
            .store(in: &cancellables)
    }
}
