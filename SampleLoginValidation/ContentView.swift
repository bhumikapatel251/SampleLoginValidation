//
//  ContentView.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 21/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @ObservedObject var emailObj = EmailValidationnobj()
    @ObservedObject var passObj = PasswordValidationobj()
    @StateObject var vm = Oauth()
    
    var body: some View {
        if vm.authenticated{
            VStack(spacing: 20){
                Text("Welcome back **\(vm.email.lowercased())**!")
                Text("Today is: **\(Date().formatted(.dateTime))**")
                Button("Log out", action: vm.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        } else{
       
            ZStack {
                VStack {
                    Text("Log In")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $vm.email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    Text(emailObj.error).foregroundColor(.red).font(.system(size: 12))
                        
                        
                    
                    SecureField("Password", text: $vm.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .autocapitalization(.none)
                    
                    Button("Login", action: vm.authenticate) 
                       //authenticateUser(username: email, password: password)
                        
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
//
//                    NavigationLink(destination: Text("You are logged in @\(email)"), isActive: $showingLoginScreen) {
//                        EmptyView()
                  }
                }
            }
    }
    
//    func authenticateUser(username: String, password: String) {
//        if email.lowercased() == "bhumi@test.com" {
//            wrongUsername = 0
//            if password.lowercased() == "Abc123" {
//                wrongPassword = 0
//                showingLoginScreen = true
//            } else {
//                wrongPassword = 2
//            }
//        } else {
//            wrongUsername = 2
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
