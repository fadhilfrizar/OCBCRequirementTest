//
//  MockRegisterModelValidator.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
@testable import OCBC_Test

class MockRegisterModelValidator: RegisterModelValidatorProtocol {
    
    var isUsernameValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isConfirmPasswordValidated: Bool = false
    
    func isUsernameValid(username: String) -> Bool {
        isUsernameValidated = true
        return isUsernameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func isConfirmPasswordValid(password: String, confirmPassword: String) -> Bool {
        isConfirmPasswordValidated = true
        return isConfirmPasswordValidated
    }
    

}
