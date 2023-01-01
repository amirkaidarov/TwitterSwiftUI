//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .top, spacing:  12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                VStack (alignment: .leading) {
                    //user info
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline.bold())
                        Text("@batman")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                    }
                    //tweet
                    Text("Where is the bomb?!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //action button
            HStack {
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()

        }.padding()
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
