//
//  LoginViewDelegateProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

protocol LoginViewDelegateProtocol: AnyObject {
    func successfullLogin()
    func errorHandler(error: LoginError)
}
