//
//  LoginPresenterProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginServiceProtocol,
         delegate: LoginViewDelegateProtocol)
    func processLogin(formModel: LoginFormModel)
}
