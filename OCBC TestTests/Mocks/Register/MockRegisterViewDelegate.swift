//
//  MockRegisterViewDelegate.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
import XCTest
@testable import OCBC_Test

class MockRegisterViewDelegate: RegisterViewProtocol {
    
    var expectation: XCTestExpectation?
    var successfulRegisterCounter = 0
    var errorHandlerCounter = 0
    var signupError: RegisterError?
    
    func successfullRegister(response: RegisterResponseModel) {
        successfulRegisterCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: RegisterError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
    
    func message(description: String) {
        expectation?.fulfill()
    }
    
    
 
}
