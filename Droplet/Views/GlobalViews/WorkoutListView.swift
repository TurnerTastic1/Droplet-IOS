//
//  WorkoutListView.swift
//  Droplet
//
//  Created by Turner Naef on 12/27/23.
//

import SwiftUI

struct WorkoutListView: View {
    
    var completedWorkouts: [CompletedWorkout]
    
    var body: some View {
        NavigationStack {
            List(completedWorkouts) { workout in
                CompletedWorkoutCellView(workout: workout)
            }
            .navigationTitle("Workouts")
        }
    }
}

#Preview {
    WorkoutListView(completedWorkouts: MockData.sampleCompletedWorkouts)
}
