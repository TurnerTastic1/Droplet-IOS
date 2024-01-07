//
//  ProfileInteractionView.swift
//  Droplet
//
//  Created by Turner Naef on 12/28/23.
//

import SwiftUI

struct ProfileInteractionView: View {
    
    @Binding var isShowingPersonalInfo: Bool
    @State private var scale: CGFloat = 1.0
    @AppStorage("test") var test = "Test"
    
    var body: some View {
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
            
            VStack {
                Text(test)
                Button(action: {
                    test = "New value"
                }) {
                    Text("Change value")
                }
                Button(action: {
                    if let bundleID = Bundle.main.bundleIdentifier {
                        UserDefaults.standard.removePersistentDomain(forName: bundleID)
                    }
                }) {
                    Text("Reset storage")
                }
            }
        }
    }
}

#Preview {
    ProfileInteractionView(isShowingPersonalInfo: .constant(false))
}
