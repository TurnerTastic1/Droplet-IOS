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
        
        static let missingName = AlertItem(title: "Missing name", details: AlertDetails(message: "Name of the workout must be between 1 and 50 characters."))
        
        static let missingDescription = AlertItem(title: "Missing description", details: AlertDetails(message: "Description of the workout must be between 1 and 200 characters."))
        
        static let invalidDate = AlertItem(title: "Invalid date", details: AlertDetails(message: "The date cannot be in the future."))
        
        static let invalidDuration = AlertItem(title: "Invalid duration", details: AlertDetails(message: "Duration must be a number and not 0."))
        
        static let missingWorkoutType = AlertItem(title: "Missing workout type", details: AlertDetails(message: "Workout type cannot be none."))
        
        static let missingTokenOrAuthIssue = AlertItem(title: "Error completing workout", details: AlertDetails(message: "Could not complete workout at this time - invalid user info."))
        
        static let serverEncounteredError = AlertItem(title: "Server encountered an error", details: AlertDetails(message: "Server encountered an error while completing the workout. Please try again later."))
    }
    
    //MARK: - Network Alerts
    struct NetworkAlertContext {
        static let defaultAlertTitleNetwork = "Error connecting to server"
        
        static let serverConnectionFailure = AlertItem(title: "Server error", details: AlertDetails(message: "Issue connecting to the server. Check your connection or contact support."))
        
    }
    
    //MARK: - Authentication Alerts
    struct AuthAlertContext {
        static let defaultAlertTitleAuth = "Unable to authenticate or register user"
        
        static let invalidForm = AlertItem(title: "Invalid form", details: AlertDetails(message: "Please ensure all fields in the form are populated."))
        
        static let passwordLength = AlertItem(title: "Invalid password", details: AlertDetails(message: "Password must be at least 6 characters (100 max)."))
        
        static let emailLength = AlertItem(title: "Invalid email", details: AlertDetails(message: "Email must be at least 5 characters (50 max)."))
        
        static let usernameLength = AlertItem(title: "Invalid username", details: AlertDetails(message: "Username must be populated (20 max)."))
        
        static let invalidUserData = AlertItem(title: "Invalid data", details: AlertDetails(message: "Invalid user data - could not encode."))
        
        static let registerFailure = AlertItem(title: "Failed to register", details: AlertDetails(message: "Server could not register the user. Please try again later."))
        
        static let authenticationFailure = AlertItem(title: "Failed to authenticate", details: AlertDetails(message: "Server could not authenticate the user. Please try again later."))
    }
}
