//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let user : User
    
    init(user : User){
        self.user = user
        self.fetchTweets()
    }
    
    func fetchTweets() {
        guard let uid = user.id else { return }
        
        service.fetchTweets(for: uid) { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
}
