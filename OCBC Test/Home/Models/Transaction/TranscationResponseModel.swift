//
//  TranscationResponseModel.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation

struct TransactionResponseModel: Decodable {
    var status: String?
    var data: [TransactionDataModel]?
    
    init(status: String?, data: [TransactionDataModel]?) {
        self.status = status
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct TransactionDataModel: Decodable {
    var transactionId: String?
    var amount: Double?
    var transactionDate: String?
    var description: String?
    var transactionType: String?
    var receipient: TransactionReceipientModel?
    
    init(transactionId: String?, amount: Double?, transactionDate: String?, description: String?, transactionType: String?, receipient: TransactionReceipientModel?) {
        self.transactionId = transactionId
        self.amount = amount
        self.transactionDate = transactionDate
        self.description = description
        self.transactionType = transactionType
        self.receipient = receipient
    }
    
    enum CodingKeys: String, CodingKey {
        case transactionId = "transactionId"
        case amount = "amount"
        case transactionDate = "transactionDate"
        case description = "description"
        case transactionType = "transactionType"
        case receipient = "receipient"
    }
}

struct TransactionReceipientModel: Decodable {
    var accountNo: String?
    var accountHolder: String?
    
    init(accountNo: String?, accountHolder: String?) {
        self.accountNo = accountNo
        self.accountHolder = accountHolder
    }
    
    enum CodingKeys: String, CodingKey {
        case accountNo = "accountNo"
        case accountHolder = "accountHolder"
    }
}

