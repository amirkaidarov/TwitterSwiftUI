//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet : Identifiable, Decodable{
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes : Int
    
    var user : User?
    var didLike : Bool?
}
