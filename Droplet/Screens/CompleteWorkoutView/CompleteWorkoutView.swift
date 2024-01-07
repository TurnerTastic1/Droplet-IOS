//
//  CompleteWorkoutView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct CompleteWorkoutView: View {
    
    @StateObject private var viewModel = CompleteWorkoutViewModel()
    
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
                    viewModel.completeWorkout()
                }
            }
            .navigationTitle("Complete Workout")
            .alert(
                viewModel.alertItem?.title ?? AlertContext.defaultAlertTitle,
                isPresented: $viewModel.showingAlert,
                presenting: viewModel.alertItem?.details
            ) { details in
                
            } message: { details in
                Text(details.message)
            }
            
        }
    }
}

#Preview {
    CompleteWorkoutView()
}
