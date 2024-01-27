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
    
    @Published var dummyImagesForSlider: [ImageType] = [
        
    ]
    
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
            } receiveValue: { [weak self] (returndImage) in
                guard let self = self else { return }
                self.image = returndImage
            }
            .store(in: &cancellables)
    }
    
    func insertToDummyImagesForSlider(image: UIImage) {
        dummyImagesForSlider.insert(UIKitImage(uiImage: image), at: 0)
        populateDummyImagesForSlider()        
    }
    
    func populateDummyImagesForSlider() {
        dummyImagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageOne))
        dummyImagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageTwo))
        dummyImagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageThree))
        dummyImagesForSlider.append(SwiftUIImage(swiftUIImage: dummyImageFour))
    }
}
