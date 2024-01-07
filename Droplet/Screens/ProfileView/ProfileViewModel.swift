//
//  ProfileViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 12/27/23.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var isShowingPersonalInfo = false
    
    func retrieveUser() {
        user = User(
            username: "JohnLifts",
            firstName: "John",
            lastName: "Doe",
            email: "jdoe@gmail.com",
            birthdate: Date(),
            bio: "Crossfitter, lifter and runner and more! I go to Crossfit Sanitas",
            personalInfo: ["info"],
            completedWorkouts: MockData.sampleCompletedWorkouts,
            age: 24,
            height: 73,
            weight: 190
        )
    }
}
