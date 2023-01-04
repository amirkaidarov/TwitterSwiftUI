//
//  ImageUploader.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/3/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image : UIImage, completion : @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData) { _, error in
            if let error = error {
                print("Failed to upload image : \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, error in
                
                if let error = error {
                    print("Failed to download image : \(error.localizedDescription)")
                    return
                }
                
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
            
            
        }
    }
}
