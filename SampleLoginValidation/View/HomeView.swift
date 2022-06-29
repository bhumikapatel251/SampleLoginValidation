//
//  HomeView.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 28/06/22.
//

import SwiftUI
import SwiftKeychainWrapper

struct HomeView: View {
    //@State var show = false
    @StateObject private var session = SessionManager()
    @StateObject var loginApi = LoginApi()
   // @EnvironmentObject var loginApi : LoginApi
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Button{
                      // KeychainWrapper.standard.removeObject(forKey: "accessToken")
                       
                        withAnimation{
                            session.LogOut()
                        }
                        
                  } label: {
                      Text("LogOut")
                  }
                }
//                if loginApi.isLoginSuccessful{
//                    LoginPage()
//                }
                
            }
        }
    }
//    func clear(){
//         KeychainWrapper.standard.removeObject(forKey: "accessToken")
//
//
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(SessionManager())
    }
}
