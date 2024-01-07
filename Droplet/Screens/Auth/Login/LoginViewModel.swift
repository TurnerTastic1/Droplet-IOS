//
//  LoginViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    
    // App Storage to hold user specifics - this can be tricky :)
    @AppStorage("userDetails") private var userDetails: Data?
    
    @Published var loginItem = LoginItem()
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false
    
    func login() {
        guard isValidForm else {
            return
        }
        
        let newUserDetails = AppDefaultsModel(username: loginItem.username, email: "blank EMAIL", password: loginItem.password, jwtToken: "blank JWT")
        
        do {
            let data = try JSONEncoder().encode(newUserDetails)
            userDetails = data
            print("Attempting to login/auth")
        } catch {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.invalidUserData
        }
        
        print("Attempting login")
    }
    
    var isValidForm: Bool {
        let username = loginItem.username
        let password = loginItem.password
        
        guard !username.isEmpty && !password.isEmpty else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.invalidForm
            return false
        }
        
        guard username.count >= 1 && username.count <= 20 else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.usernameLength
            return false
        }
        
        guard password.count >= 6 && password.count <= 100 else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.passwordLength
            return false
        }
            
        return true
    }
}
