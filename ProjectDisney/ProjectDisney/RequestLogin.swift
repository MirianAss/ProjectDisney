//
//  RequestLogin.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 05/04/23.
//

import UIKit
import Alamofire

class RequestLogin: NSObject {
    func requestLogin(email: String, password: String, completion: @escaping (Bool) ->Void) {
        let param = ["email":email, "password":password]
        AF.request("https://p3teufi0k9.execute-api.us-east-1.amazonaws.com/v1/signin", method: .post, parameters: param, encoder:JSONParameterEncoder.default).response { response in
            
            if response.response?.statusCode == 200 {
                completion(true)
            }else {
                completion(false)
            }
        }
    }
}
