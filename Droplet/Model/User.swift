//
//  User.swift
//  Droplet
//
//  Created by Turner Naef on 12/27/23.
//

import Foundation

struct User: Codable {
    
    let username: String
    let firstName: String
    let lastName: String
    let email: String
    let birthdate: Date
    let bio: String
    let personalInfo: [String]
    let completedWorkouts: [CompletedWorkout]
    let age: Int
    let height: Int
    let weight: Int
    
    init(username: String, firstName: String, lastName: String, email: String, birthdate: Date, bio: String, personalInfo: [String], completedWorkouts: [CompletedWorkout], age: Int, height: Int, weight: Int) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.bio = bio
        self.personalInfo = personalInfo
        self.completedWorkouts = completedWorkouts
        self.age = age
        self.height = height
        self.weight = weight
    }
    
    init() {
        self.username = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.birthdate = Date()
        self.bio = ""
        self.personalInfo = []
        self.completedWorkouts = []
        self.age = 0
        self.height = 0
        self.weight = 0
    }
    
}
