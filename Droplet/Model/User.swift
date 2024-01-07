//
//  User.swift
//  Droplet
//
//  Created by Turner Naef on 12/27/23.
//

import Foundation

struct User: Codable {
    
    
    
    var username = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    
    var bio = ""
    var personalInfo = [""]
    var completedWorkouts: [CompletedWorkout] = []
    
    var age = 0
    var height = 72
    var weight = 100
}
