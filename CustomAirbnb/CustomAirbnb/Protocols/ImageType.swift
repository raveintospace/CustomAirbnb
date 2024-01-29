//
//  AnyImageProtocol.swift
//  CustomAirbnb
//
//  Created by Uri on 29/1/24.
//

import Foundation
import SwiftUI

// // Handle an array that supports UIImage & Image and accepts .resizable modifier

protocol ImageType {
    var image: AnyView { get }
    var aspectRatio: CGFloat { get }
}

struct UIKitImage: ImageType {
    let uiImage: UIImage
    
    var image: AnyView {
        AnyView(Image(uiImage: uiImage).resizable())
    }
    
    var aspectRatio: CGFloat {
        return uiImage.size.width / uiImage.size.height
    }
}

struct SwiftUIImage: ImageType {
    let swiftUIImage: Image
    
    var image: AnyView {
        AnyView(swiftUIImage.resizable())
    }
    
    var aspectRatio: CGFloat {
        return 1.0
    }
}
