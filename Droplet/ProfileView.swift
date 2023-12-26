//
//  Profile.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isShowingPersonalInfo = false
    
    private var username = "John Doe"
    private var fitnessType = "Loves running and weightlifting"
    private var personalInfo = ["Age: 24", "Height: 6'1", "Weight: 190lb"]
    
    var body: some View {
        ZStack {
            //MARK: Main navigation stack view
            NavigationStack {
                VStack {
                    Button {
                        isShowingPersonalInfo = true
                    } label: {
                        HStack {
                            Image("mockProfilePhoto")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .padding(.trailing, 15)
                            
                            Text(username)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.primary)
                        }
                    }
                    .padding(.bottom, 5)
                    
                    HStack {
                        Button {
                            isShowingPersonalInfo = true
                        } label: {
                            Text("Stats")
                        }
                    }
                    
                    Text(fitnessType)
                        .font(.body)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                }
                .padding()
            }
            .blur(radius: isShowingPersonalInfo ? 20 : 0)
            .disabled(isShowingPersonalInfo)
            
            //MARK: Ability to click to close outside the personal info card
            if isShowingPersonalInfo {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isShowingPersonalInfo = false
                    }
            }
            
            //MARK: Personal info card
            if isShowingPersonalInfo {
                PersonalDetails(personalInfo: personalInfo, isShowingPersonalInfo: $isShowingPersonalInfo)
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
