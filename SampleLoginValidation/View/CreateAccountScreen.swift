//
//  CreateAccountScreen.swift
//  DemoLoginApp
//
//  Created by Bhumika Patel on 10/06/22.
//

import SwiftUI

struct CreateAccountScreen: View {
   // @EnvironmentObject var apiCalling: ApiCalling
    @State var name = ""
    @State var email = ""
    @State var pass = ""
    @State var conPass = ""
    @State var isAlert = false
    @State var isPresented = false
    @State var error = ""
    @State var visible = false
    @State var reVisible = false
    @ObservedObject var emailObj = EmailValidationnobj()
    @ObservedObject var passObj = PasswordValidationobj()
    @ObservedObject var conPassObj = ConPasswordValidationobj()
    @State var color = Color.black.opacity(0.7)
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    VStack(alignment: .leading){
                        Text("Create Account")
                            .font(.system(size: 26).bold())
                        Text("Create Your Account")
                            .font(.callout)
                       // .padding(.top,175)
                        //.multilineTextAlignment(.center)
                    }
                    .padding(.trailing,220)
                    
                    VStack(alignment: .leading){
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
                                    TextField("Password", text: self.$passObj.pass)
                                        .autocapitalization(.none)
                                } else{
                                    SecureField("Password", text: self.$passObj.pass)
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
                        Text(passObj.error).foregroundColor(.red).font(.system(size: 13))
                        Text("Confirm Password")
                            .padding(.top)
                        HStack{
                        
                            VStack{
                            
                                if self.reVisible{
                                    TextField("Confirm Password", text: self.$conPassObj.conPass)
                                        .autocapitalization(.none)
                                } else{
                                    SecureField("Confirm Password", text: self.$conPassObj.conPass)
                                        .autocapitalization(.none)
                            
                                }
                            }
                            Button(action: {
                                self.reVisible.toggle()
                            }) {
                                Image(systemName: self.reVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                    
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.conPass != "" ? Color.blue : self.color,lineWidth: 2))
                        .padding(.top, 1)
                        Text(conPassObj.error).foregroundColor(.red).font(.system(size: 13))
                            }
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding()
                    .background(Color.white)
                    .overlay(Rectangle().stroke(Color.black.opacity(0.09),lineWidth: 2).shadow(radius:5))
                    .padding(.horizontal,10)
                    .padding(.bottom,20)
                    VStack {
                        Button(action: {
                            if name != "" && email != "" && pass != "" && conPass != ""{
                                let parameters: [String: Any] = ["name": name, "email": email]
                               // apiCalling.createPosts(parameters: parameters)
                                
                                isPresented.toggle()
                            } else {
                                isAlert.toggle()
                            }
                            
                        }, label: {
                        
                            Text("Create")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal, 35)
                                .frame(width: 280, height: 50)
                                .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color-1")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(30)
                                //.frame(width: 200, height: 100, alignment: .bottom)
                        })
                        .padding(.vertical,20)
                        .padding(.leading,200)
                        .padding()
                   }
//                    //divider
//                        Rectangle()
//                         .fill(Color.gray)
//                         .opacity(1.5)
//                         .frame(width: 240,height:1)
//                         .padding(.top,15)
//
//                        HStack {
//                            NavigationLink(
//                                destination: LoginScreen().navigationBarHidden(true),
//                                label: {
//                                    Text("Already A Member?")
//                                        .foregroundColor(.black)
//                                    Text("Log In")
//                                        .font(.system(size: 18))
//                                            .fontWeight(.semibold)
//                                .foregroundColor(Color("Color-1"))
//                                }
//                            )
//                        }
                      
                    
                    
                    }
                
           // .navigationTitle("Create Account")
            }
            .offset(y: -80)
        }
       
        
    }
}

struct CreateAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountScreen()
    }
}
