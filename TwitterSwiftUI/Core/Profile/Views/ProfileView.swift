//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter : TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace private var animation
    @ObservedObject var viewModel : ProfileViewModel
    
    init(user : User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(username: "", fullname: "", profileImageURL: "", email: ""))
    }
}


extension ProfileView {
    var headerView : some View {
        ZStack (alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(Color(.white))
                        .offset(x: 16, y: 0)
                }
                
                KFImage(URL(string: viewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons : some View {
        HStack (spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                //action goes here
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(Color.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
        }
        .padding(.trailing)
    }
    
    var userInfoDetails : some View {
        VStack (alignment: .leading, spacing : 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your mom's favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack (spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                
                HStack {
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .foregroundColor(Color(.gray))
            .font(.caption)
            
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar : some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id : \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView : some View  {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweetsForFileter(for: self.selectedFilter)) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
