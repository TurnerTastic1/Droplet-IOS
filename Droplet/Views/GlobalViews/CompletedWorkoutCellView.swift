//
//  CompletedWorkoutCellView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct CompletedWorkoutCellView: View {
    
    var name: String
    var date: Date
    var imgName: String
    
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }
    
    var body: some View {
        HStack {
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(20)
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text(dateFormatter.string(from: date))
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                }
                .padding()
            }
        }
    }
}

#Preview {
    CompletedWorkoutCellView(name: "Murph", date: Date(), imgName: "murphSamplePhoto")
}
