//
//  MockLoginModelValidator.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
@testable import OCBC_Test

class MockLoginModelValidator: LoginModelValidatorProtocol {
    
    var isUsernameValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isUsernameAndPasswordValidated: Bool = false
    
    func isUsernameValid(username: String) -> Bool {
        isUsernameValidated = true
        return isUsernameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func isUsernamePasswordNotEmpty(username: String, password: String) -> Bool {
        isUsernameAndPasswordValidated = true
        return isUsernameAndPasswordValidated
    }

}
