//
//  RegisterView.swift
//  Droplet
//
//  Created by Turner Naef on 1/6/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = RegisterViewModel()
    @Binding var isShowingRegisterView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $viewModel.registerItem.username)
                    TextField("Email", text: $viewModel.registerItem.email)
                    SecureField("Password", text: $viewModel.registerItem.password)
                } header: {
                    Text("User Information")
                }

                Button {
                    print("Register button tapped")
                    viewModel.register()
                } label: {
                    Text("Register")
                        .foregroundStyle(Color("brandPrimary"))
                }
            }
            .navigationBarTitle("Registration Form")
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
            isShowingRegisterView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

#Preview {
    RegisterView(isShowingRegisterView: .constant(true))
}
