//
//  XLImageViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 27/1/24.
//

import Foundation
import SwiftUI
import Combine

// MARK: - Handle an array that supports UIImage & Image
protocol ImageType {
    var image: AnyView { get }
}

struct UIKitImage: ImageType {
    let uiImage: UIImage
    
    var image: AnyView {
        AnyView(Image(uiImage: uiImage))
    }
}

struct SwiftUIImage: ImageType {
    let swiftUIImage: Image
    
    var image: AnyView {
        AnyView(swiftUIImage)
    }
}

// MARK: - ViewModel
final class XLImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    @Published var imagesForSlider: [ImageType] = [
        
    ]
    
    let defaultReturnedImage = UIImage(named: "dummyPicSlider1") // -> create a placeholder with canva
    let dummyImageOne = Image("dummyPicSlider1")
    let dummyImageTwo = Image("dummyPicSlider2")
    let dummyImageThree = Image("dummyPicSlider3")
    let dummyImageFour = Image("dummyPicSlider4")
    
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
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self else { return }
                
                // Assign image from dataService or the placeholder
                self.image = returnedImage ?? self.defaultReturnedImage
                
                // Create the array
                if let image = self.image {
                    self.populateImagesForSliderWith(image: image)
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
