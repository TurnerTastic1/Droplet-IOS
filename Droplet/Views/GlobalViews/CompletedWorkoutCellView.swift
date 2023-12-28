//
//  CompletedWorkoutCellView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct CompletedWorkoutCellView: View {
    
    var workout: CompletedWorkout
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        HStack {
            Image(workout.imgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(workout.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(dateFormatter.string(from: workout.date))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
            
            Image(systemName: workout.workoutIconName)
        }
    }
}

#Preview {
    CompletedWorkoutCellView(workout: MockData.sampleCompletedWorkout1)
}
