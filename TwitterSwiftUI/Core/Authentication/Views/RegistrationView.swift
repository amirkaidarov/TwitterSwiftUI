//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/2/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email : String = ""
    @State private var username : String = ""
    @State private var fullname : String = ""
    @State private var password : String = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(header1: "Get Started", header2: "Create Your Account")
            
            VStack (spacing: 40) {
                CustomInputField (imageName : "envelope",
                                  placeholderText: "Email",
                                  text : $email)
                CustomInputField (imageName : "person",
                                  placeholderText: "Username",
                                  text : $username)
                CustomInputField (imageName : "person",
                                  placeholderText: "Full Name",
                                  text : $fullname)
                CustomInputField (imageName : "lock",
                                  placeholderText: "Password",
                                  isSecureField: true, 
                                  text : $password)
            }
            .padding(32)
            
            
            Button {
                viewModel.register(email: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
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
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)

        }.ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
