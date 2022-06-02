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
}
