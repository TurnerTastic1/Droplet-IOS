//
//  SelectionView.swift
//  Droplet
//
//  Created by Turner Naef on 1/7/24.
//

import SwiftUI

struct SelectionView: View {
    
    @State var showLogin = false
    @State var showRegister = false
    
    var body: some View {
        ZStack {
            if !showLogin && !showRegister {
                VStack {
                    Spacer()
                    
                    Text("Welcome to Droplet")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("brandPrimary"))
                    
                    Spacer()
                    
                    Button {
                        print("Login")
                        self.showLogin = true
                    } label: {
                        brandButton(title: "Login", width: 110, height: 55)
                    }
                    
                    Button {
                        print("Register")
                        self.showRegister = true
                    } label: {
                        brandButton(title: "Register", width: 110, height: 55)
                    }
                    
                    Spacer()
                }
            }
            
            if showLogin {
                LoginView(isShowingLoginView: $showLogin)
            }
            
            if showRegister {
                RegisterView(isShowingRegisterView: $showRegister)
            }
            
        }
    }
}

#Preview {
    SelectionView()
}
