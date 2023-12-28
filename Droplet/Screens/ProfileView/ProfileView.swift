//
//  Profile.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    private var username = "John Doe"
    private var bio = "Crossfitter, lifter and runner!"
    private var personalInfo = ["Age: 24", "Height: 6'1", "Weight: 190lb"]
    
    var body: some View {
        ZStack {
            //MARK: Main navigation stack view
            NavigationStack {
                VStack {
                    HeaderView(isShowingPersonalInfo: $viewModel.isShowingPersonalInfo, username: viewModel.user.username)
                    
                    ProfileInteractionView(isShowingPersonalInfo: $viewModel.isShowingPersonalInfo)
                    
                    Text(bio)
                        .font(.body)
                        .padding(.top, 10)
                    
                    WaterDropChartView()
                    
                    Spacer()
                    
                }
                .padding()
            }
            .blur(radius: viewModel.isShowingPersonalInfo ? 20 : 0)
            .disabled(viewModel.isShowingPersonalInfo)
            
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
                PersonalDetailsView(personalInfo: personalInfo, isShowingPersonalInfo: $viewModel.isShowingPersonalInfo)
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
