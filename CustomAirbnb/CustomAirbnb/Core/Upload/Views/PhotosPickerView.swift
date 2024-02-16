//
//  PhotosPickerView.swift
//  CustomAirbnb
//
//  Created by Uri on 16/2/24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    
    @State private var imagePreview: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $photosPickerItem, matching: .images) {
            Image(systemName: "camera")
        }
        // convert data from photosPicker to UIImage
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        imagePreview = image
                    }
                }
                
                // make it available for future selections
                photosPickerItem = nil
            }
        }
    }
}

#Preview {
    PhotosPickerView()
}
