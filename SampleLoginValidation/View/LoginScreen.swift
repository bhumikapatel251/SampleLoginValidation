//
//  LoginScreen.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 21/06/22.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20){
            Text("Log In").font(.largeTitle)
            Field(value: $email, placeholder: "email", icon: "envelope.fill")
                .keyboardType(.emailAddress)
            Field(value: $password, placeholder: "password", isSecure: true, icon: "lock.fill")
            
                
                Button{
                    
                    } label: {
                        Text("ForgotPassword")
                            .foregroundColor(Color.blue)
                            .fontWeight(.semibold)
                                                    
                                                    
                    }
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                   
                        
            
                        
            
            Button(action: {},
                   label: {
                Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                    .font(.system(size: 30))
                    
            })
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .cornerRadius(10)
            
            Rectangle()
                .fill(Color.gray)
                .opacity(1.5)
                .frame(width: 240,height:1)
                .padding(.top,15)
            
            HStack{
                Button{
                    
                }
                    label: {
                    Text("Don't Have An Account?")
                        .foregroundColor(.black)
                    Text("Create Account")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.blue)
                    }
                        

            }
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
struct Field: View {
    @Binding var value: String
    var placeholder: String
    var isSecure:Bool = false
    var icon: String
    
    var body: some View{
        HStack{
            Image(systemName: icon).padding()
            if isSecure {
                SecureField(placeholder, text: $value).autocapitalization(.none)
            }else{
                TextField(placeholder,text: $value).font(Font.system(size: 20, design: .monospaced))
            }
                
        }
        .foregroundColor(.black)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .multilineTextAlignment(.leading)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
    }
}
