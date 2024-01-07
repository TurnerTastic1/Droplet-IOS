//
//  CompleteWorkoutViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import Foundation
import SwiftUI

final class CompleteWorkoutViewModel: ObservableObject {
    
    @Published var completedWorkout = CompletedWorkout()
    @Published var uploading = false
    
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false
    
    // Duration number input formatter
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    func completeWorkout() {
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(completedWorkout)
            print(data)
        } catch {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.invalidForm
        }
    }
    
    var isValidForm: Bool {
        guard !completedWorkout.name.isEmpty else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingName
            return false
        }
        
        // Comparing submitted date to the current date/time with a 1 second buffer
        guard completedWorkout.date < Date().addingTimeInterval(1) else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.invalidDate
            return false
        }
        
        guard !completedWorkout.description.isEmpty else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingDescription
            return false
        }
        
        guard !completedWorkout.totalTime.isNaN && !completedWorkout.totalTime.isZero else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.invalidDuration
            return false
        }
        
        guard completedWorkout.workoutType != WorkoutType.NONE else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingWorkoutType
            return false
        }
        
        return true
    }
}
