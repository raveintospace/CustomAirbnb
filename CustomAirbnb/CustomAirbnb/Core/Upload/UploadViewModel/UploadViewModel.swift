//
//  UploadViewModel.swift
//  CustomAirbnb
//
//  Created by Uri on 5/2/24.
//

import Foundation
import UIKit

final class UploadViewModel: ObservableObject {
    
    let cities = City.stub
    
    let globeImages = ["globe.americas", "globe.europe.africa", "globe.central.south.asia", "globe.asia.australia"]
    
    // Dismiss Upload sheet from UploadThirdView when form is submited
    @Published var dismissUploadSheet: Bool = false
    
    @Published var selectedHood: String? = nil
    
    @Published var imagePreviews: [UIImage] = []
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var price: String = ""
    @Published var guestsText: String = ""
    @Published var bedsText: String = ""
    @Published var bedroomsText: String = ""
    @Published var bathroomsText: String = ""
    
    var isContinueButtonThirdViewEnabled: Bool {
        return !title.isEmpty &&
        !description.isEmpty &&
        isGreaterThanZero(price) &&
        isGreaterThanZero(guestsText) &&
        isGreaterThanZero(bedsText) &&
        isGreaterThanZero(bedroomsText) &&
        isGreaterThanZero(bathroomsText)
    }
}
