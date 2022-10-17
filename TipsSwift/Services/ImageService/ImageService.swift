//
//  ImageService.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 16.10.2022.
//
import SwiftUI
import Combine
import Foundation
import FirebaseStorage

class ImageService : ImageServiceProtocol {
    private let storage = Storage.storage()
    static var shared = ImageService()
    private init() {}
    
    func uploadImage(image: UIImage, completionHandler: @escaping (_ imageUrl: String) -> Void) {
        let imageID = UUID().uuidString
        let storageRef = storage.reference().child("images/Picture_\(imageID.split(separator: "-").joined(separator: "")).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        let data = image.jpegData(compressionQuality: 1.0)
        if let data = data {
            storageRef.putData(data, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error while uploading file: ", error)
                }
                if let metadata = metadata {
                    print("Metadata: ", metadata)
                    storageRef.downloadURL(completion: { (url, error) in
                        completionHandler(url?.absoluteString ?? "NO URL")
                    })
                }
            }
            
        }
    }
    func removeImage(url: String) {
        let storageRef = storage.reference(forURL: url)
        storageRef.delete { error in
            print(error)
        }
    }
}
