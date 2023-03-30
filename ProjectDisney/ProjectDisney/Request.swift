//
//  Request.swift
//  ProjectDisney
//
//  Created by Mirian Santana on 30/03/23.
//

import UIKit
import Alamofire

protocol RequestDelegate: NSObject {
    func finishProtocol(arrayDeDisney: Disney?)
}

class Request: NSObject {
    var arrayDisney: Disney?
    weak var delegate: RequestDelegate?
    
    func requestDisney(completion: @escaping (Disney?) -> Void) {
        AF.request("https://api.disneyapi.dev/characters").response { response in
            
            let disney = try? JSONDecoder().decode(Disney.self, from: response.data ?? Data())
            
            self.arrayDisney = disney
            completion(disney)
            self.delegate?.finishProtocol(arrayDeDisney: disney)
        }
    }
}
