//
//  CompletedWorkout.swift
//  Droplet
//
//  Created by Turner Naef on 12/28/23.
//

import Foundation

struct CompletedWorkout: Identifiable {
    let id: Int
    var name: String
    var date: Date
    var imgName: String
    var description: String
    var workoutType: WorkoutType
    var totalTime: Double
    
    var workoutIconName: String
    
//    var workoutIconName: String {
//        switch workoutType {
//        case .CARDIO:
//            "figure.run"
//        case .STRENGTH:
//            "dumbbell"
//        case .CLIMBING:
//            "figure.climbing"
//        case .YOGA:
//            "figure.yoga"
//        case .CROSSFIT:
//            "figure.strengthtraining.traditional"
//        case .FUNCTIONAL:
//            "figure.strengthtraining.functional"
//        case .FLEXIBILITY:
//            "figure.step.training"
//        case .MOBILITY:
//            "figure.flexibility"
//        case .RECOVERY:
//            "figure.mind.and.body"
//        case .SPORT:
//            "figure.soccer"
//        case .OTHER:
//            "dumbbell.fill"
//        }
//    }
}

public enum WorkoutType {
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

//func getWorkoutType(completedWorkout: CompletedWorkout) {
//    completedWorkout.workoutIconName =
//    switch completedWorkout.workoutType {
//    case .CARDIO:
//        "figure.run"
//    case .STRENGTH:
//        "dumbbell"
//    case .CLIMBING:
//        "figure.climbing"
//    case .YOGA:
//        "figure.yoga"
//    case .CROSSFIT:
//        "figure.strengthtraining.traditional"
//    case .FUNCTIONAL:
//        "figure.strengthtraining.functional"
//    case .FLEXIBILITY:
//        "figure.step.training"
//    case .MOBILITY:
//        "figure.flexibility"
//    case .RECOVERY:
//        "figure.mind.and.body"
//    case .SPORT:
//        "figure.soccer"
//    case .OTHER:
//        "dumbbell.fill"
//    }
//}
