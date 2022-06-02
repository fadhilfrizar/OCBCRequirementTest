//
//  LoginModelValidatorProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

protocol LoginModelValidatorProtocol {
    
    func isUsernameValid(username: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
//    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
