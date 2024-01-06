//
//  CompleteWorkoutViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/5/24.
//

import Foundation

final class CompleteWorkoutViewModel: ObservableObject {
    
    @Published var completedWorkout = CompletedWorkout()
    @Published var uploading = false
}
