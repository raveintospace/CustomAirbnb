//
//  ImagePickerView.swift
//  CustomAirbnb
//  To select images from the photo library or taking new photos using the camera
//  Created by Uri on 20/2/24.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType      // camera or library
    var onImagePicked: (UIImage?) -> Void                   // closure to handle the selected image
    
    // Communication between UIImagePickerController and SwiftUI.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Required method for UIViewControllerRepresentable
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        parent.onImagePicked(image)
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.onImagePicked(nil)
        picker.dismiss(animated: true)
    }
    
}
