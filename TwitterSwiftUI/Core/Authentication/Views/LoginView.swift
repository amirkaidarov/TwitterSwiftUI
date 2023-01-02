//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/2/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    var body: some View {
        VStack {
            //header view
            VStack (alignment: .leading) {
                HStack{Spacer()}
                
                Text("Hello,")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
             
            VStack (spacing: 40) {
                CustomInputField (imageName : "envelope",
                                  placeholderText: "Email",
                                  text : $email)
                CustomInputField (imageName : "lock",
                                  placeholderText: "Password",
                                  text : $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                print("Sign in here")
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule()
                    )
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .padding(.top)

            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))

                
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
