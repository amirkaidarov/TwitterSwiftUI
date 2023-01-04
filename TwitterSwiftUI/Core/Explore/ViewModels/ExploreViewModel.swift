//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Амир Кайдаров on 1/4/23.
//

import Foundation

class ExploreViewModel : ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    var searchableUsers : [User] {
        if searchText.isEmpty {
            return users
        } else {
            let searchQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.lowercased().contains(searchQuery) ||
                $0.fullname.lowercased().contains(searchQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        self.fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
    
    
}
