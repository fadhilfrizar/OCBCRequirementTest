//
//  MockRegisterPresenter.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
@testable import OCBC_Test

class MockRegisterPresenter: RegisterPresenterProtocol {
    
    var processRegisterCalled: Bool = false
    
    required init(formModelValidator: RegisterModelValidatorProtocol, webservice: RegisterServiceProtocol, delegate: RegisterViewProtocol) {
        //TODO:
    }
    
    func processRegister(formModel: RegisterFormModel) {
        processRegisterCalled = true
    }
}
