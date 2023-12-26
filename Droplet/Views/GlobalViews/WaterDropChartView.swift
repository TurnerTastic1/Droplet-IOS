//
//  WaterDropChartView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct WaterDropChartView: View {
    let data = (1...5).map { _ in
        (1...7).map { _ in
            Int.random(in: 1...100)
        }
    }
    
    var body: some View {
        VStack {
            Text("Droplets")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
                .padding()
            
            ForEach(data, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        WaterDropCellView(completed: true)
                            .frame(minWidth: 20)
                    }
                }
            }
        }
        .frame(width: 250, height: 250)
        .foregroundStyle(Color.secondary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    WaterDropChartView()
}
