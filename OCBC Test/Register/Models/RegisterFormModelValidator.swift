//
//  RegisterFormModelValidator.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

class RegisterFormModelValidator: RegisterModelValidatorProtocol {
    
    func isUsernameValid(username: String) -> Bool {
        var returnValue = true
        
        if username.count < 2 || username.count > 20 {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < 2 || password.count > 20 {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isConfirmPasswordValid(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
}
