//
//  ListingImageDataService.swift
//  CustomAirbnb
//
//  Created by Uri on 19/12/23.
//

import Foundation
import SwiftUI
import Combine

final class ListingImageDataService {
    
    @Published var image: UIImage? = nil
    
    // exclusive cancellable for getListingImage
    private var imageSubscription: AnyCancellable?
    
    private let listing: Listing
    private let fileManager = LocalFileManager.instance
    private let folderName = "listing_images"  // -> custom name for the folder where we store listing images
    private let imageName: String
    
    init(listing: Listing) {
        self.listing = listing
        self.imageName = listing.id
        getListingImage()
    }
    
    private func getListingImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadListingImage()
        }
    }
    
    private func downloadListingImage() {
        
        guard let url = URL(string: listing.mediumURL ?? "") else { return }
        
        imageSubscription = NetworkManager.fetch(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {
                [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel() // -> cancel because it won't call api continously
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
