//
//  LoginView.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @Binding var isShowingLoginView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                } header: {
                    Text("User Information")
                }

                Button {
                    print("Login button tapped")
                }label: {
                    Text("Login")
                }
            }
            .navigationBarTitle("Login Form")
        }
        .overlay(Button {
            isShowingLoginView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    LoginView(isShowingLoginView: .constant(true))
}
