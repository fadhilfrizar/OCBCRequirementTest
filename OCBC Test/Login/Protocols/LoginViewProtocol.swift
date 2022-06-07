//
//  LoginViewDelegateProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    func successfullLogin(response: LoginResponseModel)
    func errorHandler(error: LoginError)
    func startLoading()
    func finishLoading()
    func message(description: String)
}
