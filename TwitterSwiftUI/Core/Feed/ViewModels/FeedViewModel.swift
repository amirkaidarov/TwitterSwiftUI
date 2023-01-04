//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation


class FeedViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    
    init() {
        self.fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(with: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
    
    
}
