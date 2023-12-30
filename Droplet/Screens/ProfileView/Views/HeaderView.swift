//
//  Header.swift
//  Droplet
//
//  Created by Turner Naef on 12/28/23.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var isShowingPersonalInfo: Bool
    var username: String
    
    var body: some View {
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
                
                Text(username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                
                Spacer()
            }
        }
        .padding([.bottom, .top], 5)
    }
}

#Preview {
    HeaderView(isShowingPersonalInfo: .constant(false), username: "JohnLifts")
}
