//
//  LoginView.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @Binding var isShowingLoginView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $viewModel.loginItem.username)
                    SecureField("Password", text: $viewModel.loginItem.password)
                } header: {
                    Text("User Information")
                }

                Button {
                    viewModel.login()
                }label: {
                    Text("Login")
                }
            }
            .navigationBarTitle("Login Form")
            .alert(
                viewModel.alertItem?.title ?? AlertContext.AuthAlertContext.defaultAlertTitleAuth,
                isPresented: $viewModel.showingAlert,
                presenting: viewModel.alertItem?.details
            ) { details in
                
            } message: { details in
                Text(details.message)
            }
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
