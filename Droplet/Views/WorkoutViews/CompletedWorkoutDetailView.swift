//
//  CompletedWorkoutDetailView.swift
//  Droplet
//
//  Created by Turner Naef on 12/31/23.
//

import SwiftUI

struct CompletedWorkoutDetailView: View {
    
    var workout: CompletedWorkout
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            
            VStack {
                Text(workout.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(workout.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    CompletedWorkoutDetailView(workout: MockData.sampleCompletedWorkout1, isShowingDetail: .constant(true))
}
