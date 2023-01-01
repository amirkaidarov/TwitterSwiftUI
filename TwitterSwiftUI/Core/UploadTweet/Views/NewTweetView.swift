//
//  TweetView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption : String = ""
    @Environment(\.presentationMode) var presentationMode
    
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
                    print("Tweet")
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
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's new?", text: $caption)
                
            }
            .padding()
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
