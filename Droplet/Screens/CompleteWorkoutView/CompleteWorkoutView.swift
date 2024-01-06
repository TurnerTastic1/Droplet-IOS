//
//  CompleteWorkoutView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct CompleteWorkoutView: View {
    
    //@State private var progress = 0.0
    @State private var progress: CGFloat = 0.0
    @StateObject var viewModel = CompleteWorkoutViewModel()
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Workout Name", text: $viewModel.completedWorkout.name)
                DatePicker("Select a date", selection: $viewModel.completedWorkout.date)
                TextField("Description", text: $viewModel.completedWorkout.description)
                TextField("Total Time", value: $viewModel.completedWorkout.totalTime, formatter: NumberFormatter())
                
                Picker("Workout Type", selection: $viewModel.completedWorkout.workoutType) {
                    ForEach(WorkoutType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type.rawValue)
                    }
                }
                .onChange(of: viewModel.completedWorkout.workoutType) { newValue, _ in
                    viewModel.completedWorkout.workoutType = WorkoutType(rawValue: newValue.rawValue) ?? .OTHER
                }
                
                Button("Submit") {
                    print(viewModel.completedWorkout)
                    viewModel.uploading = true
                }
            }
            .navigationTitle("Complete Workout")
            
//            if (viewModel.uploading) {
//                ProgressView(value: progress)
//            }
            
            
        }
    }
}

#Preview {
    CompleteWorkoutView()
}
