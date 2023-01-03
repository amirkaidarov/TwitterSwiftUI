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
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func isAuthenticated() -> Bool {
        return userSession != nil
    }
    
    func login(withEmail email : String, andPassword password : String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.userSession = result?.user
        }
        
    }
    
    func register(email : String, password : String, fullname : String, username : String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid" : user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in }
            
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
}
