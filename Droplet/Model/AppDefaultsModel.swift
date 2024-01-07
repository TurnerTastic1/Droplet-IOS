//
//  AppDefaultsModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import Foundation

struct AppDefaultsModel: Codable {
    let username: String
    let email: String
    let password: String
    let jwtToken: String
}
