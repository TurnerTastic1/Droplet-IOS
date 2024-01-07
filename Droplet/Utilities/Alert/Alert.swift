//
//  Alert.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import Foundation

struct AlertDetails: Identifiable {
    let id = UUID()
    let message: String
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let details: AlertDetails
}

struct AlertContext {
    //MARK: - Global Alert Defaults
    public static let defaultAlertTitle: String = "Could not complete task"
    
    //MARK: - Complete Workout View Alerts
    struct CompleteWorkoutViewAlertContext {
        static let defaultAlertTitleCompleteWorkout = "Unable to complete workout"
        
        static let invalidForm = AlertItem(title: "Invalid form", details: AlertDetails(message: "Please ensure all fields in the form have been filled out."))
        
        static let missingName = AlertItem(title: "Missing name", details: AlertDetails(message: "Name of the workout must be between 1 and 50 characters"))
        
        static let missingDescription = AlertItem(title: "Missing description", details: AlertDetails(message: "Description of the workout must be between 1 and 200 characters"))
        
        static let invalidDate = AlertItem(title: "Invalid date", details: AlertDetails(message: "The date cannot be in the future"))
        
        static let invalidDuration = AlertItem(title: "Invalid duration", details: AlertDetails(message: "Duration must be a number and not 0"))
        
        static let missingWorkoutType = AlertItem(title: "Missing workout type", details: AlertDetails(message: "Workout type cannot be none"))
    }
    
    //MARK: - Network Alerts
    struct NetworkAlertContext {
        
    }
}
