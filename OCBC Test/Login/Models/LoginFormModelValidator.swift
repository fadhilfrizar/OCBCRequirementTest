//
//  LoginFormModelValidator.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

class LoginFormModelValidator: LoginModelValidatorProtocol {
    
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
    
    func isUsernamePasswordNotEmpty(username: String, password: String) -> Bool {
        var returnValue = true
        if username.isEmpty || password.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
}
