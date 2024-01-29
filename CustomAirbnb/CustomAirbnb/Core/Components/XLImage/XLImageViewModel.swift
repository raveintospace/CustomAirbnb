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
    
    @Published var imagesForSlider: [ImageType] = [
        
    ]
    
    private let defaultReturnedImage = UIImage(named: "noXLPictureAvailable")
    private let dummyImageOne = Image("dummyPicSlider1")
    private let dummyImageTwo = Image("dummyPicSlider2")
    private let dummyImageThree = Image("dummyPicSlider3")
    private let dummyImageFour = Image("dummyPicSlider4")
    
    let listing: Listing
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
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self else { return }
                
                // Create an array with the image from the Api call or assign the placeholder
                if let xlImage = returnedImage {
                    self.populateImagesForSliderWith(image: xlImage)
                } else {
                    self.image = defaultReturnedImage
                }
            }
            .store(in: &cancellables)
    }
    
    func populateImagesForSliderWith(image: UIImage) {
        imagesForSlider.insert(UIKitImage(uiImage: image), at: 0)
        appendDummyImagesForSlider()
    }
    
    func appendDummyImagesForSlider() {
        imagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageOne))
        imagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageTwo))
        imagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageThree))
        imagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageFour))
    }
}
