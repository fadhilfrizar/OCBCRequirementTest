//
//  RegisterModelValidatorProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

protocol RegisterModelValidatorProtocol {
    
    func isUsernameValid(username: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func isConfirmPasswordValid(password: String, confirmPassword: String) -> Bool
}
