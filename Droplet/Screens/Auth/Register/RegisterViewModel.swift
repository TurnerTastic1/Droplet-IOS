//
//  RegisterViewModel.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    @Published var registerItem = RegisterItem()
    @Published var alertItem: AlertItem?
    @Published var showingAlert = false
    
    func register() {
        guard isValidForm else {
            return
        }
        
        print("Attempting register")
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
