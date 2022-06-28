//
//  LoginApi.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 28/06/22.
//

import Foundation
import Alamofire

struct Logintest: Encodable {
    let email: String
    let password: String
}
class LoginApi: ObservableObject{
    @Published var result: ResultData? = nil
    @Published var isLoginSuccessful = false
    @Published var isCorrect = false

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
                            if let parseJSON = json{
                                let test = responsetest
                            }
                                self.isLoginSuccessful = true
                                print("success")
                            }else{
                                print("try again")
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
