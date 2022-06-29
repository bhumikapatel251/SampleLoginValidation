//
//  LoginApi.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 28/06/22.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

struct Logintest: Encodable {
    let email: String
    let password: String
}
class LoginApi: ObservableObject{
    @Published var result: ResultData? = nil
    @Published var isLoginSuccessful = false
    @Published var isCorrect = false
    @Published var displayMessage = false

    func fetchUser(username : String, password : String) {
        
        let headers: HTTPHeaders = [
            .contentType("application/x-www-form-urlencoded")
        ]
        
        let login = Logintest(email: username, password: password)
                AF.request("https://demologin.laraveldeveloper.online/api/login", method: .post, parameters: login, headers: headers).response{responsetest in
                    debugPrint(responsetest)
                    switch responsetest.result{
                    case.success(let data):
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                            if responsetest.response?.statusCode == 200 {
                            
                                let test = responsetest
                                self.isLoginSuccessful = true
                                print("success")
                            }else{
                                print("try again")
                            }
                            if let parseJSON = json{
                               // let test = responsetest
                                let accessToken = parseJSON["access_token"] as? String
                                //let userId = parseJSON["id"] as? String
                               // print("accessToken:\(accessToken)")
                                let saveAccessToken: Bool = KeychainWrapper.standard.set(accessToken!, forKey: "accessToken")
                                //let saveUserId: Bool = KeychainWrapper.standard.set(userId!, forKey: "userId")
                                print("The access token save result: \(saveAccessToken)")
                                //print("The UserId save result: \(saveUserId)")
                                if(accessToken?.isEmpty)!{
                                    self.displayMessage = true
                                   print("try again")
                                    
                                } else{
                                    //self.isLoginSuccessful = true
                                    print("success")
                                }
                            }
                        }catch{
                            print(error.localizedDescription)
                        }
                case.failure(let err):
                print(err.localizedDescription)
            }

        }
    }
   
}
