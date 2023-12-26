//
//  WaterDropCellView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct WaterDropCellView: View {
    
    var completed: Bool
    
    var body: some View {
        Image(systemName: completed ? "drop.fill" : "drop")
            .foregroundStyle(Color(.brandPrimary))
    }
}

#Preview {
    WaterDropCellView(completed: true)
}
