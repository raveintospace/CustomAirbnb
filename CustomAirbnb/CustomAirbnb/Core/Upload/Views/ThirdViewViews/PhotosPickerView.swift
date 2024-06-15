//
//  PhotosPickerView.swift
//  CustomAirbnb
//  Created by Uri on 16/2/24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    
    @ObservedObject var viewModel: UploadViewModel
    
    @State private var shouldPresentConfirmationDialog: Bool = false
    @State private var shouldPresentImagePicker: Bool = false
    @State private var shouldPresentCamera: Bool = false
    @State private var selectedImageIndex: Int?
    @State private var isReplaceAction: Bool = false
    
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 20, verticalSpacing: 15) {
                ForEach(0..<2, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(0..<5, id: \.self) { columnIndex in
                            let index = rowIndex * 5 + columnIndex
                            if index < viewModel.imagePreviews.count {
                                Image(uiImage: viewModel.imagePreviews[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        selectedImageIndex = index
                                        shouldPresentConfirmationDialog = true
                                    }
                            } else {
                                cameraPlaceholder
                                    .onTapGesture {
                                        selectedImageIndex = nil
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
                    if let index = selectedImageIndex, isReplaceAction, let newImage = images.first {
                        viewModel.imagePreviews[index] = newImage
                    } else {
                        viewModel.imagePreviews.append(contentsOf: images)
                    }
                }
            }
            .sheet(isPresented: $shouldPresentCamera) {
                ImagePickerCamera(sourceType: .camera) { image in
                    if let index = selectedImageIndex, isReplaceAction, let newImage = image {
                        viewModel.imagePreviews[index] = newImage
                    } else if let newImage = image {
                        viewModel.imagePreviews.append(newImage)
                    }
                }
            }
            .confirmationDialog("Select photo", isPresented: $shouldPresentConfirmationDialog) {
                if selectedImageIndex != nil {
                    Button("Replace") {
                        isReplaceAction = true
                        shouldPresentImagePicker = true
                    }
                    Button("Delete") {
                        if let index = selectedImageIndex {
                            viewModel.imagePreviews.remove(at: index)
                        }
                    }
                } else {
                    Button("Camera") {
                        isReplaceAction = false
                        shouldPresentCamera = true
                    }
                    Button("Photo library") {
                        isReplaceAction = false
                        shouldPresentImagePicker = true
                    }
                }
                Button("Cancel", role: .cancel) { }
            }
        }
}

#Preview {
    PhotosPickerView(viewModel: UploadViewModel())
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
