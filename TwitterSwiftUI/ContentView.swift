//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/1/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
            mainInterfaceView
        } else {
            AuthView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    var mainInterfaceView : some View {
        ZStack (alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(0.25)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .background(showMenu ? Color.white : Color.clear)
                .offset(x: showMenu ? 0 : -300, y : 0)
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem (placement : .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear() {
            showMenu = false
        }
    }
}
