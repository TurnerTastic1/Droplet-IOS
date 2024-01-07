//
//  MockData.swift
//  Droplet
//
//  Created by Turner Naef on 12/28/23.
//

import Foundation

struct MockData {
    static let sampleProfileViewModel = ProfileViewModel()
    
    static let sampleUser = User(
        username: "JohnLifts",
        firstName: "John",
        lastName: "Doe",
        email: "jdoe@gmail.com",
        birthdate: Date(),
        bio: "Crossfitter, lifter and runner!",
        completedWorkouts: sampleCompletedWorkouts,
        age: 24,
        height: 73,
        weight: 190
    )
    
    static let sampleCompletedWorkout1 = CompletedWorkout(id: 001, name: "Murph", date: Date(), imgName: "sampleWorkoutPhoto1", description: "Hero Workout honoring Navy Seal Michael Murphy. For time with a 20lb vest: 1 mile run, 100 pullups, 200 pushups, 300 airsquats, 1 mile run", workoutType: WorkoutType.CROSSFIT, totalTime: 67.29)
    
    static let sampleCompletedWorkout2 = CompletedWorkout(id: 002, name: "Chest day", date: Date(), imgName: "sampleWorkoutPhoto1", description: "Chest day with large amounts of shoulder focus!", workoutType: WorkoutType.STRENGTH, totalTime: 42.37)
    
    static let sampleCompletedWorkout3 = CompletedWorkout(id: 003, name: "Yoga", date: Date(), imgName: "sampleWorkoutPhoto1", description: "Yoga with advanced stretching and movements!", workoutType: WorkoutType.YOGA, totalTime: 60.00)
    
    static let sampleCompletedWorkout4 = CompletedWorkout(id: 004, name: "Cardio", date: Date(), imgName: "sampleWorkoutPhoto1", description: "10 mile run at a 8 minute pace!", workoutType: WorkoutType.CARDIO, totalTime: 80.00)
    
    static let sampleCompletedWorkouts = [sampleCompletedWorkout1, sampleCompletedWorkout2, sampleCompletedWorkout3, sampleCompletedWorkout4]
    
}
