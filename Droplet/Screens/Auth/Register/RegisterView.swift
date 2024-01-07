//
//  RegisterView.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                } header: {
                    Text("User Information")
                }

                Button {
                    print("Register button tapped")
                }label: {
                    Text("Register")
                }
            }
            .navigationBarTitle("Registration Form")
        }
    }
}

#Preview {
    RegisterView()
}
