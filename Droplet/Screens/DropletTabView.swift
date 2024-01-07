//
//  DropletTabView.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct DropletTabView: View {
    
    @AppStorage("userDetails") private var userDetails: Data?
    
    var body: some View {
        ZStack {
            if (userDetails != nil) {
                TabView () {
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
                        .frame(height: 2)
                        .foregroundStyle(Color.secondary)
                        .offset(y: 325)
                )
            }
            
            if (userDetails == nil) {
                SelectionView()
            }
        }
        .onAppear(perform: {
            ServerManager.shared.rootStatusCheckService()
        })
    }
}

#Preview {
    DropletTabView()
}

