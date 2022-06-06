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
    
    init(status: String, accountNo: String, balance: Int) {
        self.status = status
        self.accountNo = accountNo
        self.balance = balance
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case accountNo = "accountNo"
        case balance = "balance"
    }
}
