//
//  SampleLoginValidationApp.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 21/06/22.
//

import SwiftUI
import SwiftKeychainWrapper
@main
struct SampleLoginValidationApp: App {
    @StateObject var loginApi = LoginApi()
    
    @ObservedObject var emailObj = EmailValidationnobj()
    var body: some Scene {
    
        WindowGroup {
            //LoginPage()
            
                 let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")

                    if accessToken != nil{
                        HomeView()
                       
                    }else{
                      
                        LoginPage()
                    }
                        
                
                    //.navigationBarHidden(true)
               
            
//           ContentView()
        //    .navigationBarHidden(true)
             
           
        }
    }
}
