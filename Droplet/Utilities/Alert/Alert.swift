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
        static let invalidForm = AlertItem(title: "Invalid form", details: AlertDetails(message: "Please ensure all fields in the form have been filled out."))
    }
    
    //MARK: - Network Alerts
    struct NetworkAlertContext {
        
    }
}
