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
    
    let alertCompleteWorkoutFailureTitle = "Unable to complete workout"
    
    func completeWorkout() {
        
        showingAlert = true
        alertItem = AlertContext.CompleteWorkoutViewAlertContext.invalidForm
    }
}
