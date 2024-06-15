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
    
    // MARK: - Dismiss Upload sheet from UploadThirdView
    @Published var dismissUploadSheet: Bool = false
    
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
        isValidInteger(price) &&
        isValidInteger(guestsText) &&
        isValidInteger(bedsText) &&
        isValidInteger(bedroomsText) &&
        isValidInteger(bathroomsText)
    }
    
    private func isValidInteger(_ value: String) -> Bool {
        if let intValue = Int(value), intValue > 0 {
            return true
        }
        return false
    }
}
