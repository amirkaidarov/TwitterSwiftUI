//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(feedViewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "message")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
