//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    let service = TweetService()
    private let userService = UserService()
    let user : User
    
    init(user : User){
        self.user = user
        self.fetchTweets()
        self.fetchLikedTweets()
    }
    
    func tweetsForFileter(for filter : TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
             return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
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
    
    func fetchLikedTweets(){
        guard let uid = user.id else { return }
        
        service.fetchLikedTweets(for: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(with: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
