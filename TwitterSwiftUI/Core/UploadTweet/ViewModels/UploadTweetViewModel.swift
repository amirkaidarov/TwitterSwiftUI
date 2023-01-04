//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation


class UploadTweetViewModel : ObservableObject {
    let service = TweetService()
    @Published var didUploadTweet = false
    
    func uploadTweet(withCaption caption : String) {
        service.uploadTweet(caption: caption) { isSuccessful in
            self.didUploadTweet = isSuccessful 
        }
    }
}
