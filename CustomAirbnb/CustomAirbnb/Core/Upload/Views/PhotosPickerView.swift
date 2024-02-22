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
    @State private var photosPickerItems: [PhotosPickerItem] = []
    
    @State private var image: Image? = Image("airlogo")
    @State private var shouldPresentImagePicker: Bool = false
    @State private var shouldPresentActionScheet: Bool = false
    @State private var shouldPresentCamera: Bool = false
    
    var body: some View {
        PhotosPicker(selection: $photosPickerItems, maxSelectionCount: 10, selectionBehavior: .ordered, matching: .images) {
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
        
        //        if let dummyImage = image {
        //            dummyImage
        //                .resizable()
        //                .scaledToFit()
        //                .frame(width: 50, height: 50)
        //                .overlay(RoundedRectangle(cornerRadius: 10)
        //                    .stroke(Color.theme.secondaryText.opacity(0.5), lineWidth: 1)
        //                    .frame(width: 50, height: 50))
        //                .onTapGesture { self.shouldPresentActionScheet = true }
        //                .sheet(isPresented: $shouldPresentImagePicker) {
        //                    ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
        //                }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
        //                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
        //                        self.shouldPresentImagePicker = true
        //                        self.shouldPresentCamera = true
        //                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
        //                        self.shouldPresentImagePicker = true
        //                        self.shouldPresentCamera = false
        //                    }), ActionSheet.Button.cancel()])
        //                }
        //        }
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
