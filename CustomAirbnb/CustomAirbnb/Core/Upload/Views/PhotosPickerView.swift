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
            PhotosPicker(selection: $photosPickerItems, maxSelectionCount: 10, selectionBehavior: .ordered, matching: .images) {
                ScrollView(.horizontal) {
                    Grid(horizontalSpacing: 10, verticalSpacing: 15) {
                        ForEach(0..<2, id: \.self) { rowIndex in
                            GridRow {
                                ForEach(0..<5, id: \.self) { columnIndex in
                                    let index = rowIndex * 5 + columnIndex
                                    if index < imagePreviews.count {
                                        Image(uiImage: imagePreviews[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .onTapGesture {
                                                // delete or replace picture
                                            }
                                    } else {
                                        cameraPlaceholder
                                    }
                                }
                            }
                        }
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

extension PhotosPickerView {
    
    private var cameraPlaceholder: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.secondaryText.opacity(0.5), lineWidth: 1)
                .frame(width: 60, height: 60)
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.theme.secondaryText.opacity(0.5))
        }
    }
}

// MARK: - To Do
/*
 
 - Placeholder effect, if user does not upload a picture, show the placeholder like Wallapop
 - extract views to extension
 - update color
 
 Image(uiImage: imagePreview ?? UIImage(resource: .airlogo))
 .resizable()
 .aspectRatio(contentMode: .fill)
 .frame(width: 100, height: 100)
 
 code for photospicker array
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
 
 */
