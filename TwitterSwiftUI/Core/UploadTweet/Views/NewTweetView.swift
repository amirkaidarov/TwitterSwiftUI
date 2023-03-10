//
//  TweetView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption : String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel : AuthViewModel
    @ObservedObject var tweetViewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    tweetViewModel.uploadTweet(withCaption:caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }
            .padding()
            
            HStack (alignment: .top ){
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                
                TextArea("What's new?", text: $caption)
                
            }
            .padding()
        }
        .onReceive(tweetViewModel.$didUploadTweet) { isSuccessful in
            if isSuccessful {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
