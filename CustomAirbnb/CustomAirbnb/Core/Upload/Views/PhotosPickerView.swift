//
//  PhotosPickerView.swift
//  CustomAirbnb
//  https://www.youtube.com/watch?v=jCskmh46L-s
//  Created by Uri on 16/2/24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    
    @State private var imagePreviews: [UIImage] = []
    @State private var photosPickerItems: [PhotosPickerItem] = []
    
    var body: some View {
        VStack {
            PhotosPicker("Select photos", selection: $photosPickerItems, maxSelectionCount: 10, selectionBehavior: .ordered, matching: .images)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<imagePreviews.count, id: \.self) { index in
                        Image(uiImage: imagePreviews[index])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                    }
                }
            }
        }
        
        // convert data from photosPicker to UIImage
        .onChange(of: photosPickerItems) { _, _ in
            Task {
                for item in photosPickerItems {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            imagePreviews.append(image)
                        }
                    }
                }
        
                // make photosPickerItems available for future selections
                    photosPickerItems.removeAll()
            }
        }
    }
}

#Preview {
    PhotosPickerView()
}
