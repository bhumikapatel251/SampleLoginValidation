//
//  LoginPage.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 23/06/22.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        Login1()
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
struct Home1: View {
   
    
    var body: some View{
        VStack{
            Spacer()
            
        }
    }
}
struct Login1: View{
    @State var email = ""
    @State var pass = ""
    var defaultEmail = ""
    var defaultPass = ""
    @State var visible = false
    @State var color = Color.black.opacity(0.7)
    @State var alert = false
    @State var error = ""
    @State private var showingLoginScreen = false
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @StateObject var loginApi = LoginApi()
    @ObservedObject var emailObj = EmailValidationnobj()
  //  @ObservedObject var passObj = PasswordValidationobj()
  //  @StateObject var vm = Oauth()
    var body: some View{
        NavigationView{
            ZStack{
                ZStack(alignment: .topTrailing){
                    GeometryReader{_ in
                        VStack(alignment:.leading){
                            Text("Log In")
                                .font(.system(size: 22).bold())
                            .padding(.top,175)
                            .multilineTextAlignment(.center)
                            Text("Log in your Account")
                                .font(.callout)
                            
                            Text(self.error).foregroundColor(.red).font(.system(size: 16))
                                .padding(.top,1)
                            Text("Email")
                                .padding(.top)
                            TextField("Email", text: self.$emailObj.email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color.blue : self.color,lineWidth: 2))
                                .padding(.top, 1)
                            Text(emailObj.error).foregroundColor(.red).font(.system(size: 13))
                            Text("Password")
                                .padding(.top)
                            HStack{
                                
                                VStack{
                                    
                                    if self.visible{
                                        TextField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    } else{
                                        SecureField("Password", text: self.$pass)
                                            .autocapitalization(.none)
                                    
                                    }
                                }
                                Button(action: {
                                    self.visible.toggle()
                                }) {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }
                            .padding()
                            
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color.blue : self.color,lineWidth: 2))
                            .padding(.top, 1)
                            //Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
                            HStack{
                                Button{
                                
                                    } label: {
                                        Text("ForgotPassword?")
                                            .foregroundColor(Color.blue)
                                            .fontWeight(.semibold)
                                                                
                                                                
                                    }
                                    .padding(.leading, 20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                               
                                    
                        
                                    
                        
                                Button {
                                    
                                    // check email and password empty
                                    self.verify()
                                   
                                } label: {
                                    
                                Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(width: 150, height: 40)
                                .background(Color.blue)
                                .cornerRadius(10)
                                    NavigationLink(destination: Text("You are logged in @\($emailObj.email.wrappedValue)"), isActive: $loginApi.isLoginSuccessful) {
                                        EmptyView()
                                    }
                                }
                            }.padding(.vertical,25)
                        }.padding(.horizontal, 15)
                    }
                    Button(action: {
                        
                    }) {
                        Text("Register")
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
                
                if self.alert{
                    ErrorView(alert: self.$alert, error: self.$error)
                }
            }
            .navigationBarHidden(true)
        }
    }
    func verify() {
        if self.$emailObj.email.wrappedValue != "" && self.pass != "" {
            
//            if self.email == defaultEmail && self.pass == defaultPass{
//                showingLoginScreen = true
            loginApi.fetchUser(username: $emailObj.email.wrappedValue, password: pass)
//            }else{
//                self.error = "wrong email and pass"
//                self.alert.toggle()
//
//            }
        }else{
            self.error = "Email and Password can't be empty"
            //self.alert.toggle()
        }
        
    }
//    func authenticateUser(username: String, password: String) {
//       // print("auth user")
//       // print(username, password)
//        
//        if username.lowercased() == defaultEmail && password == defaultPass {
//            wrongUsername = 0
//                showingLoginScreen = true
//        }else {
//            wrongPassword = 2
//            self.error = "Please enter currect Email and Password"
//           // self.alert.toggle()
//        }
//    }
}

struct ErrorView : View{
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
