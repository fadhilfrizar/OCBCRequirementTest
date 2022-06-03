//
//  MockLoginViewDelegate.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
import XCTest
@testable import OCBC_Test

class MockLoginViewDelegate: LoginViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError: LoginError?
    
    func successfullLogin(response: LoginResponseModel) {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: LoginError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    func startLoading() {
    }
    
    func finishLoading() {
    }
    
    func usernameAndPasswordEmpty(description: String) {
        expectation?.fulfill()
    }
 
}
