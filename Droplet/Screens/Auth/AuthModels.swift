//
//  AuthModels.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import Foundation

struct RegisterItem: Codable {
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
    init() {
        self.username = ""
        self.email = ""
        self.password = ""
    }
}

struct LoginItem: Codable {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    init() {
        self.username = ""
        self.password = ""
    }
}
