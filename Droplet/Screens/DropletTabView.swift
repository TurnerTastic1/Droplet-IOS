//
//  DropletTabView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct DropletTabView: View {
    var body: some View {
        TabView () {
            DailyView()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Daily")
                }
            CompleteWorkoutView ()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Complete Workout")
                }
            ProfileView ()
                .tabItem {
                    Image(systemName: "person")
                    Text("You")
                }
        }
        .tint(Color("brandPrimary"))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.secondary)
                .offset(y: 325)
            )
    }
}

#Preview {
    DropletTabView()
}

