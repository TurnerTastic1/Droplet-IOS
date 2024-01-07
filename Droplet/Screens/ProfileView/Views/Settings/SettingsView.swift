//
//  SettingsView.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isShowingSettings: Bool
    
    var body: some View {
        VStack {
            Form {
                Button {
                    if let bundleID = Bundle.main.bundleIdentifier {
                        UserDefaults.standard.removePersistentDomain(forName: bundleID)
                    }
                } label: {
                    Text("Logout")
                }
            }
            .padding()
            .overlay(Button {
                isShowingSettings = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
        }
    }
}

#Preview {
    SettingsView(isShowingSettings: .constant(true))
}
