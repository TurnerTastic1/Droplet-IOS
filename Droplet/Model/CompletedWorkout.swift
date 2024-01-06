//
//  CompletedWorkout.swift
//  Droplet
//
//  Created by Turner Naef on 12/28/23.
//

import Foundation

struct CompletedWorkout: Identifiable, Codable, Hashable {
    let id: Int
    var name: String
    var date: Date
    var imgName: String
    var description: String
    var workoutType: WorkoutType
    var totalTime: Double
    
    init() {
        self.id = 0
        self.name = ""
        self.date = Date()
        self.imgName = ""
        self.description = ""
        self.workoutType = .OTHER
        self.totalTime = 0.0
    }
    
    // Initializer that takes arguments
    init(id: Int, name: String, date: Date, imgName: String, description: String, workoutType: WorkoutType, totalTime: Double) {
        self.id = id
        self.name = name
        self.date = date
        self.imgName = imgName
        self.description = description
        self.workoutType = workoutType
        self.totalTime = totalTime
    }
    
    var workoutIconName: String {
        switch workoutType {
        case .CARDIO:
            "figure.run"
        case .STRENGTH:
            "dumbbell"
        case .CLIMBING:
            "figure.climbing"
        case .YOGA:
            "figure.yoga"
        case .CROSSFIT:
            "figure.strengthtraining.traditional"
        case .FUNCTIONAL:
            "figure.strengthtraining.functional"
        case .FLEXIBILITY:
            "figure.step.training"
        case .MOBILITY:
            "figure.flexibility"
        case .RECOVERY:
            "figure.mind.and.body"
        case .SPORT:
            "figure.soccer"
        case .OTHER:
            "dumbbell.fill"
        }
    }
}

public enum WorkoutType: String, CaseIterable, Codable {
    case CARDIO
    case STRENGTH
    case CLIMBING
    case YOGA
    case CROSSFIT
    case FUNCTIONAL
    case FLEXIBILITY
    case MOBILITY
    case RECOVERY
    case SPORT
    case OTHER
}
