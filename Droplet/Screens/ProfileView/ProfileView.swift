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
    private var bio = "Crossfitter, lifter and runner!"
    private var personalInfo = ["Age: 24", "Height: 6'1", "Weight: 190lb"]
    
    @State private var scale: CGFloat = 1.0
    
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
                                .padding([.trailing, .leading], 15)
                            
                            Spacer()
                            
                            Text(username)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.primary)
                            
                            Spacer()
                        }
                    }
                    .padding(.bottom, 5)
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            isShowingPersonalInfo = true
                        } label: {
                            VStack {
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                
                                Text("Stats")
                            }
                            .foregroundStyle(Color(.brandPrimary))
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            VStack {
                                Image(systemName: "person.fill.badge.plus")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .scaleEffect(scale)
                                                .onAppear {
                                                    withAnimation(.easeInOut(duration: 0.5)) {
                                                        scale = 1.2
                                                    }
                                                    withAnimation(.easeInOut(duration: 0.5).delay(0.5)) {
                                                        scale = 1.0
                                                    }
                                                }
                                
                                Text("Follow")
                            }
                            .foregroundStyle(Color(.brandPrimary))
                        }
                        .padding()
                        
                        Spacer()
                    }
                    
                    Text(bio)
                        .font(.body)
                        .padding(.top, 10)
                    
                    WaterDropChartView()
                    
                    
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
                PersonalDetailsView(personalInfo: personalInfo, isShowingPersonalInfo: $isShowingPersonalInfo)
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
