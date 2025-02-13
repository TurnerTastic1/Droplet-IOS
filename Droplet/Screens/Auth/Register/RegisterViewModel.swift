//
//  RegisterViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import SwiftUI

final class RegisterViewModel: ObservableObject {
    
    // App Storage to hold user specifics - this can be tricky :)
    @AppStorage("userDetails") private var userDetails: Data?
    
    @Published var registerItem = RegisterItem()
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false
    
    func register() {
        guard isValidForm else {
            return
        }
        print("Attempting to register - validations passed - RegisterViewModel - Register func")
        
        var responseToken: String = ""
        
        ServerManager.shared.registerNewUserService(registerItem: registerItem) { result in
            switch result {
            case .success(let response):
                print("User registered - RegisterViewModel - Register func")
                print(response.code)
                
                responseToken = response.data.auth.accessToken
                
                let newUserDetails = AppDefaultsModel(username: self.registerItem.username, email: self.registerItem.email, password: self.registerItem.password, jwtToken: responseToken)
                
                do {
                    let data = try JSONEncoder().encode(newUserDetails)
                    self.userDetails = data
                } catch {
                    self.showingAlert = true
                    self.alertItem = AlertContext.AuthAlertContext.invalidUserData
                }
                
                break
            case .failure(_):
                print("Error registering user - RegisterViewModel - Register func")
                self.showingAlert = true
                self.alertItem = AlertContext.AuthAlertContext.registerFailure
                return
            }
        }
        
    }
    
    var isValidForm: Bool {
        let username = registerItem.username
        let email = registerItem.email
        let password = registerItem.password
        
        guard !username.isEmpty && !email.isEmpty && !password.isEmpty else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.invalidForm
            return false
        }
        
        guard username.count >= 1 && username.count <= 20 else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.usernameLength
            return false
        }
        
        guard email.count >= 5 && email.count <= 50 else {
            showingAlert = true
            alertItem = AlertContext.AuthAlertContext.emailLength
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
