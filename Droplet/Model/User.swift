//
//  User.swift
//  Droplet
//
//  Created by Turner Naef on 12/27/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
