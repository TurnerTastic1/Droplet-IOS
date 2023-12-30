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
        VStack {
            List(completedWorkouts) { workout in
                CompletedWorkoutCellView(workout: workout)
            }
        }
    }
}

#Preview {
    WorkoutListView(completedWorkouts: MockData.sampleUser.completedWorkouts)
}
