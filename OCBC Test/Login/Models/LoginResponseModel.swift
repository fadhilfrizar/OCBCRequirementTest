//
//  LoginResponseModel.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

struct LoginResponseModel: Decodable {
    var status: String
    var token: String
    var username: String
    var accountNo: String
    
    init(status: String, token: String, username: String, accountNo: String) {
        self.status = status
        self.token = token
        self.username = username
        self.accountNo = accountNo
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case token = "token"
        case username = "username"
        case accountNo = "accountNo"
    }
}
