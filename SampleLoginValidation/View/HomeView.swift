//
//  HomeView.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 28/06/22.
//

import SwiftUI
import SwiftKeychainWrapper

struct HomeView: View {
    @State private var show = false
    
    @StateObject var loginApi = LoginApi()
    
    @State var logOut = false
   // @EnvironmentObject var loginApi : LoginApi
    var body: some View {
//        if loginApi.isLoginSuccessful{
//            LoginPage()
//        }
        ZStack{
         
            VStack{
                VStack{
                    Button{
                   
                  //  KeychainWrapper.standard.removeObject(forKey: "accessToken")
                      //  loginApi.isLoginSuccessful = false
                       
                        
                        
                  } label: {
                        Text("LogOut")
                  }
                    let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
                    Text(accessToken! )
                }
            
        }
                    
        }
//                if loginApi.isLoginSuccessful{
//                    LoginPage()
//                }
    
       
    }
//    func clear(){
//
//        if loginApi.isLoginSuccessful{
//            LoginPage()
//        }
//
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
