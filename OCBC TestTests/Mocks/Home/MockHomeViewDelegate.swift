//
//  MockHomeViewDelegate.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
import XCTest
@testable import OCBC_Test

class MockHomeViewDelegate: HomeViewProtocol {
    
    var expectation: XCTestExpectation?
    var successfulBalanceCounter = 0
    var successfulTransactionCounter = 0
    var errorHandlerCounter = 0
    var homeError: HomeError?

    func successfullGetBalance(response: BalanceResponseModel) {
        successfulBalanceCounter += 1
        expectation?.fulfill()
    }
    
    func successfullGetTransaction(response: TransactionResponseModel) {
        successfulTransactionCounter += 1
        expectation?.fulfill()
    }
    func errorHandler(error: HomeError) {
        homeError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
 
    func tokenIsValid(description: String) {
        expectation?.fulfill()
    }
    
}

