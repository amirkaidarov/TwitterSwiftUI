//
//  TweetRowViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/5/23.
//

import Foundation

class TweetRowViewModel : ObservableObject {
    private let service = TweetService()
    
    @Published var tweet : Tweet
    
    init(tweet : Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet(tweet)
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(_ tweet : Tweet) {
        service.checkIfUserLikedTweet(tweet) { didLike in
            self.tweet.didLike = didLike
        }
    }
        
}
