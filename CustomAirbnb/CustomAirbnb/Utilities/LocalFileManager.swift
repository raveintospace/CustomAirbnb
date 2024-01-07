//
//  LocalFileManager.swift
//  CustomAirbnb
//
//  Created by Uri on 21/12/23.
//

import Foundation
import SwiftUI

final class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }  // private so instance can only be initialized from class LocalFileManager
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, folderName: folderName)
            else { return }    // we have to save data to fileManager
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            debugPrint("Error saving image. ImageName: \(imageName) \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                debugPrint("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    // the folder where we store our images
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    // the url where we store each image in our folder
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
