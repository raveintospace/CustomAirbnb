//
//  PhotosPickerView.swift
//  CustomAirbnb
//  https://www.youtube.com/watch?v=jCskmh46L-s - SwiftUI PhotoPicker Sean Allen
//  Created by Uri on 16/2/24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    
    @State private var imagePreviews: [UIImage] = []
    @State private var shouldPresentConfirmationDialog: Bool = false
    @State private var shouldPresentImagePicker: Bool = false
    @State private var shouldPresentCamera: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 20, verticalSpacing: 15) {
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
                                    .onTapGesture {
                                        shouldPresentConfirmationDialog = true
                                    }
                            }
                        }
                    }
                }
            }
        }
            .sheet(isPresented: $shouldPresentImagePicker) {
                ImagePicker { images in
                    imagePreviews.append(contentsOf: images)
                }
            }
            .sheet(isPresented: $shouldPresentCamera) {
                ImagePickerCamera(sourceType: .camera) { image in
                    if let image = image {
                        imagePreviews.append(image)
                    }
                }
            }
            .confirmationDialog("Select photo", isPresented: $shouldPresentConfirmationDialog) {
                Button("Camera") {
                    shouldPresentCamera = true
                }
                Button("Photo library") {
                    shouldPresentImagePicker = true
                }
                Button("Cancel", role: .cancel) { }
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
 
 */
