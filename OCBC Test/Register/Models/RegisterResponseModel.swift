//
//  RegisterResponseModel.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

struct RegisterResponseModel: Decodable {
    
    var status: String
    var token: String
    
    init(status: String,token: String) {
        self.status = status
        self.token = token
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case token = "token"
    }
    
}
