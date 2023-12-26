//
//  PersonalDetails.swift
//  Droplet
//
//  Created by Turner Naef on 12/26/23.
//

import SwiftUI

struct PersonalDetailsView: View {
    
    var personalInfo: [String]
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
                    ForEach(personalInfo, id: \.self) { info in
                            Text(info)
                                .font(.title3)
                                .fontWeight(.semibold)
                    }
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
    PersonalDetailsView(personalInfo: ["Age: 24", "Height: 6'1", "Weight: 190lb"], isShowingPersonalInfo: .constant(true))
}
