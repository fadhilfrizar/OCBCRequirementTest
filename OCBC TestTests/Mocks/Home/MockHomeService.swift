//
//  MockHomeService.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
@testable import OCBC_Test

class MockHomeService: HomeServiceProtocol {
    
    var isBalanceMethodCalled: Bool = false
    var isTransactionMethodCalled: Bool = false
    
    var balanceShouldReturnError: Bool = false
    var transactionShouldReturnError: Bool = false
    
    var isBalanceStatusFailed: Bool = false
    var isTransactionStatusFailed: Bool = false
    
    var isBalanceInvalidRequestURLString: Bool = false
    var isTransactionInvalidRequestURLString: Bool = false
    
    
    func balance(completionHandler: @escaping (BalanceResponseModel?, HomeError?) -> Void) {
        isBalanceMethodCalled = true
        
        if balanceShouldReturnError {
            
            if isBalanceStatusFailed {
                let responseModel = BalanceResponseModel(status: "failed", accountNo: "", balance: nil)
                completionHandler(responseModel, nil)
                return
            }
            
            if isBalanceInvalidRequestURLString {
                completionHandler(nil, HomeError.invalidRequestURLString)
                return
            }
            
            completionHandler(nil, HomeError.failedRequest(description: "Balance request was not successful"))
            
            
        } else {
            let responseModel = BalanceResponseModel(status: "success", accountNo: "2970-111-3648", balance: 0)
            completionHandler(responseModel, nil)
        }
    }
    
    func transaction(completionHandler: @escaping (TransactionResponseModel?, HomeError?) -> Void) {
        isTransactionMethodCalled = true
        
        if transactionShouldReturnError {
            
            if isTransactionStatusFailed {
                let responseModel = TransactionResponseModel(status: "failed", data: nil)
                completionHandler(responseModel, nil)
                return
            }
            
            if isTransactionInvalidRequestURLString {
                completionHandler(nil, HomeError.invalidRequestURLString)
                return
            }
            
            completionHandler(nil, HomeError.failedRequest(description: "Transaction request was not successful"))
            
            
        } else {
            let responseModel = TransactionResponseModel(status: "success", data: [
                TransactionDataModel(transactionId: "622cb8b68c7f3a5bcccf8ba4",
                                     amount: 1,
                                     transactionDate: "2022-03-12T15:13:58.927Z",
                                     description: "testing",
                                     transactionType: "transfer",
                                     receipient:
                                        TransactionReceipientModel(accountNo: "6554-630-9653",
                                                                   accountHolder: "Andy"
                                                                  )
                                    )
            ])
            completionHandler(responseModel, nil)
        }
    }
}
