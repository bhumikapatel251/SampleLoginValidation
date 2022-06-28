//
//  LoginModel.swift
//  SampleLoginValidation
//
//  Created by Bhumika Patel on 28/06/22.
//

import Foundation
struct LoginModel : Encodable {
    let email : String
    let password : String
   // let updated_at : String?
   // let created_at : String?
  // let id : Int?

//    enum CodingKeys: String, CodingKey {
//
//        case name = "name"
//        case email = "email"
//       // case updated_at = "updated_at"
//      //  case created_at = "created_at"
//        case id = "id"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//       // updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
//       // created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//    }

}

//struct DataModel: Decodable {
//    let id : Int
//    let name : String
//    let email : String
//    let password : String
//    let conpassword : String
//}
struct RequestData: Codable {
    var name: String
    var password: String
}
struct ResultData: Codable {
    
    var access_token: String
   
}
struct Result: Codable {
    var data: ResultData?
    var error: ErrorData?
}
struct ErrorData: Codable {
    var api_name: String
    var message: String
    var message_shortcode: String
    var qs: String
    var status: Int
    var url: String
}

