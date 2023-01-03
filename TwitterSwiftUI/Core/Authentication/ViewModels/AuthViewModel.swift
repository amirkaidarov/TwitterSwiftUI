//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/3/23.
//

import SwiftUI
import FirebaseAuth


class AuthViewModel : ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func isAuthenticated() -> Bool {
        return userSession != nil
    }
    
    func login(withEmail email : String, andPassword password : String) {
        
    }
    
    func register(email : String, password : String, fullname : String, username : String) {
        
    }
    
}
