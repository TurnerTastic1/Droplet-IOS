//
//  Profile.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            //MARK: Main navigation stack view
            if !viewModel.isShowingSettings {
                NavigationStack {
                    ScrollView {
                        HeaderView(isShowingPersonalInfo: $viewModel.isShowingPersonalInfo, username: viewModel.user.username)
                        
                        ProfileInteractionView(isShowingPersonalInfo: $viewModel.isShowingPersonalInfo, isShowingSettings: $viewModel.isShowingSettings)
                        
                        VStack(alignment: .trailing) {
                            Text(viewModel.user.bio)
                                .font(.title2)
                                .fontWeight(.medium)
                                .padding([.leading, .trailing], 20)
                        }
                        .padding(.bottom, 20)
                        
                        ForEach(viewModel.user.completedWorkouts, id: \.self) { workout in
                            CompletedWorkoutCellView(workout: workout)
                        }
                    }
                }
                .blur(radius: (viewModel.isShowingPersonalInfo || viewModel.isShowingSettings) ? 20 : 0)
                .disabled((viewModel.isShowingPersonalInfo || viewModel.isShowingSettings))
            }
            
            //MARK: Ability to click to close outside the personal info card
            if viewModel.isShowingPersonalInfo {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.isShowingPersonalInfo = false
                    }
            }
            
            //MARK: Personal info card
            if viewModel.isShowingPersonalInfo {
                PersonalDetailsView(user: viewModel.user, isShowingPersonalInfo: $viewModel.isShowingPersonalInfo)
            }
            
            if viewModel.isShowingSettings {
                SettingsView(isShowingSettings: $viewModel.isShowingSettings)
            }
            
        }
        .onAppear {
            viewModel.retrieveUser()
        }
    }
}

#Preview {
    ProfileView()
}
