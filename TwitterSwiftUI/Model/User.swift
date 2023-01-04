//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct User : Identifiable, Decodable {
    @DocumentID var id : String?
    let username : String
    let fullname : String
    let profileImageURL : String
    let email : String
    
    var isCurrentUser : Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
