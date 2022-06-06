//
//  RegisterPresenterProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
    init(formModelValidator: RegisterModelValidatorProtocol, webservice: RegisterServiceProtocol,
         delegate: RegisterViewProtocol)
    func processRegister(formModel: RegisterFormModel)
}
