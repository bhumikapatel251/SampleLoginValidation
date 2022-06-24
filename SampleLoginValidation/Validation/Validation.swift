//
//  Validation.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 22/06/22.
//

import Foundation
import SwiftUI

extension ContentView{
    class Oauth: ObservableObject{
        @AppStorage("Auth_Key") var authenticated = false {
            willSet{ objectWillChange.send() }
        }
        @AppStorage("User_Key") var email = ""
        
        @Published var password = ""
        @Published var invalid: Bool = false
        
        private var sampleEmail = "bhumi@gmail.com1"
        private var samplePassword = "1221"
        
        init() {
            print("Currently Logged On: \(authenticated)")
            print("Current email: \(email)")
        }
        func toggleAuthentication(){
            self.password = ""
            
            withAnimation{
                authenticated.toggle()
            }
        }
        func authenticate() {
            guard self.email.lowercased() == sampleEmail else {
                self.invalid = true
                return
            }
            guard self.password.lowercased() == samplePassword else {
                self.invalid = true
                return
            }
            toggleAuthentication()
        }
        func logOut(){
            toggleAuthentication()
        }
        func logPressed(){
            print("Button Pressed.")
        }
    }
}
class EmailValidationnobj: ObservableObject{
    @Published var email = ""{
        didSet {
            if self.email.isEmpty{
                self.error = "Required"
            } else if !self.email.isValidEmail() {
              self.error = "Invalid Email"
            }else {
                self.error = ""
            }
        }
    }
    @Published var error = ""
}

class PasswordValidationobj: ObservableObject{
    @Published var pass = "" {
        didSet {
            self.isValidPassword()
        }
    }
    @Published var error = ""
    private func isValidPassword(){
        guard !self.pass.isEmpty else {
            self.error = "Required"
            return
        }
        let setPassError = self.pass.isPassword() == false
        
        if setPassError{
            if self.pass.count < 6 {
                self.error = "Must be at least 6 characters."
                return
            }
            if !self.pass.isUpperCase(){
                self.error = "Must be at least 1 Uppercase characters."
                return
            }
            if !self.pass.isLowerCase(){
                self.error = "Must be at least 1 Lowercase characters."
                return
            }
            if !self.pass.containsCharacter(){
                self.error = "Must be at least 1 Special characters."
                return
            }
            if !self.pass.containsDigit(){
                self.error = "Must be at least 1 Digit."
                return
            }else {
                self.error = ""
            }
        }
    }
    
}
extension String {
    func isValidEmail()-> Bool {
        let emailRegEx = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
        "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailValidation = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return emailValidation.evaluate(with: self)
    }
    
    func isPassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        let passwordValidation  = NSPredicate(format: "SELF MATCHES[c] %@", passwordRegEx)
        return passwordValidation.evaluate(with: self)
    }
    
    func isUpperCase() -> Bool {
        let upperRegEx = ".*[A-Z]+.*"
        let upperValidation  = NSPredicate(format: "SELF MATCHES[c] %@", upperRegEx)
        return upperValidation.evaluate(with: self)
    }
    
    func isLowerCase() -> Bool {
        let lowerRegEx = ".*[a-z]+.*"
        let lowerValidation  = NSPredicate(format: "SELF MATCHES[c] %@", lowerRegEx)
        return lowerValidation.evaluate(with: self)
    }
    
    func containsCharacter() -> Bool {
        let containsCharacterRegEx = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
        let containsCharacterValidation  = NSPredicate(format: "SELF MATCHES[c] %@", containsCharacterRegEx)
        return containsCharacterValidation.evaluate(with: self)
    }
    
    func containsDigit() -> Bool {
        let containsDigitRegEx = ".*[0-9]+.*"
        let containsDigitValidation  = NSPredicate(format: "SELF MATCHES[c] %@", containsDigitRegEx)
        return containsDigitValidation.evaluate(with: self)
    }
}
