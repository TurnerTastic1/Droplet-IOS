//
//  CompleteWorkoutViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import Foundation
import SwiftUI

final class CompleteWorkoutViewModel: ObservableObject {
    
    @AppStorage("userDetails") private var userDetails: Data?
    
    @Published var completedWorkout = CompletedWorkout()
    @Published var uploading = false
    @Published var dateDTO = Date()
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
        
        //MARK: Format date
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
        
        let date = dateDTO
        let formatter = ISO8601DateFormatter()
        let formattedDate = DateFormatter().string(from: date)
        print(dateDTO)
        print(formattedDate)
        
        let completedWorkoutDTO = CompletedWorkout(id: 0, name: completedWorkout.name, date: formattedDate, imgName: completedWorkout.imgName, description: completedWorkout.description, workoutType: completedWorkout.workoutType, totalTime: completedWorkout.totalTime)
        
        // Extract token if exists
        var token = ""
        if UserDefaults.standard.object(forKey: "userDetails") != nil, let data = userDetails, let user = try? JSONDecoder().decode(AppDefaultsModel.self, from: data) {
            // userDetails exists
            print("token: \(user)")
            token = user.jwtToken
        } else {
            print("Failed to decode userDetails")
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingTokenOrAuthIssue
            showingAlert = true
            return
        }
        
        if token.isEmpty {
            print("token found empty")
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingTokenOrAuthIssue
            showingAlert = true
            return
        }
        print("token: \(token)")
        
        print(completedWorkout)
        ServerManager.shared.completeWorkoutService(completedWorkoutItem: completedWorkoutDTO, jwtToken: token) { result in
            switch result {
            case .success(let response):
                print("Workout Completed - completeWorkoutViewModel -completeWorkout func")
                print(response)
                break
            case .failure(_):
                print("Error completing workout - completeWorkoutViewModel -completeWorkout func")
                self.showingAlert = true
                self.alertItem = AlertContext.CompleteWorkoutViewAlertContext.serverEncounteredError
                return
            }
        }
        
        return
    }
    
    var isValidForm: Bool {
        guard !completedWorkout.name.isEmpty else {
            showingAlert = true
            alertItem = AlertContext.CompleteWorkoutViewAlertContext.missingName
            return false
        }
        
        // Comparing submitted date to the current date/time with a 1 second buffer
        guard dateDTO < Date().addingTimeInterval(1) else {
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
