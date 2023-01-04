//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/3/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class AuthViewModel : ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var isLogin = true
    @Published var currentUser : User?
    
    private var tempUserSession : FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func toggleIsLogin() {
        isLogin.toggle()
    }
    
    func login(withEmail email : String, andPassword password : String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
        
    }
    
    func register(email : String, password : String, fullname : String, username : String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid" : user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
            
        }
    }
    
    func uploadProfileImage(_ image : UIImage, completion : @escaping() -> Void) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image) { imageURL in
            self.userSession = self.tempUserSession
            self.fetchUser()
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageURL" : imageURL]) { _ in
                    completion()
                }
        
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    private func fetchUser() {
        if let uid = userSession?.uid {
            service.fetchUser(with: uid) { user in
                self.currentUser = user
            }
        }
    }
}
