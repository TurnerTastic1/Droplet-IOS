//
//  PersonalDetails.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct PersonalDetailsView: View {
    
    var user: User
    @Binding var isShowingPersonalInfo: Bool
    
    var body: some View {
        VStack {
            List {
                Section(
                    header: Text("Biometrics")
                        .padding(.top)
                        .font(.title2)
                        .fontWeight(.bold)
                )
                {
                    DetailTextView(title: "Age: \(user.age) yrs")
                    DetailTextView(title: "Height: \(user.height) in")
                    DetailTextView(title: "Weight: \(user.weight) lb")
                }
                .headerProminence(.increased)
                
            }
            .listStyle(.insetGrouped)
        }
        .frame(width: 300, height: 300)
        .foregroundStyle(Color.secondary)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingPersonalInfo = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    PersonalDetailsView(user: MockData.sampleUser, isShowingPersonalInfo: .constant(true))
}

struct DetailTextView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
    }
}
