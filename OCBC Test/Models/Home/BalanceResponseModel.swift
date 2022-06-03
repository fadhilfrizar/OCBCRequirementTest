//
//  BalanceResponseModel.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation


struct BalanceResponseModel: Decodable {
    var status: String
    var accountNo: String
    var balance: Int
}
