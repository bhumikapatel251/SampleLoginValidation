//
//  LoginScreen.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 21/06/22.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = "bhumi@test.com"
    @State private var password = "Abc@123"
    var defaultEmail = "bhumi@test.com"
    var defaultPass = "Abc@123"
    @ObservedObject var emailObj = EmailValidationnobj()
    @ObservedObject var passObj = PasswordValidationobj()
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @State var alert = false
    @State var error = ""
    var body: some View {
        NavigationView{
            ZStack {
                ZStack {
                    VStack(alignment: .leading,spacing: 20){
                        Text("Log In").font(.largeTitle)
                        Field(value: $emailObj.email, placeholder: "email", icon: "envelope.fill")
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        Text(emailObj.error).foregroundColor(.red).font(.system(size: 12))
                            .border(.red, width: CGFloat(wrongUsername))
                       
                        Field(value: $passObj.pass, placeholder: "password", isSecure: true, icon: "lock.fill")
                        .autocapitalization(.none)
                        Text(passObj.error).foregroundColor(.red).font(.system(size: 12))
                            .border(.red, width: CGFloat(wrongPassword))
                        HStack{
                            Button{
                            
                                } label: {
                                    Text("ForgotPassword?")
                                        .foregroundColor(Color.blue)
                                        .fontWeight(.semibold)
                                                            
                                                            
                                }
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                           
                                
                    
                                
                    
                            Button("Login") {
                                // check email and password empty
                                if self.$emailObj.email.wrappedValue != "" && self.$passObj.pass.wrappedValue != ""{
                                    authenticateUser(username: $emailObj.email.wrappedValue, password: $passObj.pass.wrappedValue)
                                } else {
                                   
                                  
                                    self.error = "Please enter email and password"
                                    self.alert.toggle()
                               }
                              //  self.verify()
                                
                                }
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                            .cornerRadius(10)
                            NavigationLink(destination: Text("You are logged in @\(emailObj.email)"), isActive: $showingLoginScreen) {
                                EmptyView()
                            }
                            
                        }
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
                        
                    }.navigationBarHidden(true)
                        
                        .padding()
                }
                if self.alert{
                    ErrorView1(alert: self.$alert, error: self.$error)
                }
            }
            
        }
    }
//    func verify() {
//        
//    }
    func authenticateUser(username: String, password: String) {
       // print("auth user")
       // print(username, password)
        
        if username.lowercased() == defaultEmail {
            wrongUsername = 0
            if password == defaultPass {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                
                wrongPassword = 2
                self.error = "Please enter currect Password"
                self.alert.toggle()
            }
        } else {
            wrongUsername = 2
            self.error = "Please enter currect Email"
            self.alert.toggle()
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
                TextField(placeholder,text: $value).font(Font.system(size: 18, design: .monospaced))
            }
                
        }
        .foregroundColor(.black)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .multilineTextAlignment(.leading)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
    }
}
struct ErrorView1 : View{
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    var body: some View{
        GeometryReader{_ in
            VStack{
                HStack{
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(Color.black)
                    .padding(.top)
                    .padding(.horizontal,25)
                Button(action: {
                    self.alert.toggle()
                }) {
                
                    Text("Ok")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top,25)
            }
            .padding(.vertical,25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }.padding(.top,150)
            .padding(.horizontal,35)
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
