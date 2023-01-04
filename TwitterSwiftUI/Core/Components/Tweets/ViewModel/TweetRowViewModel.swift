//
//  TweetRowViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/5/23.
//

import Foundation

class TweetRowViewModel : ObservableObject {
    private let service = TweetService()
    
    let tweet : Tweet
    
    init(tweet : Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet()
    }
        
}
