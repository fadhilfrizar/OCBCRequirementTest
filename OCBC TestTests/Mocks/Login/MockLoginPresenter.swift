//
//  MockLoginPresenter.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
@testable import OCBC_Test

class MockLoginPresenter: LoginPresenterProtocol {
    
    var processLoginCalled: Bool = false
    
    required init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginServiceProtocol, delegate: LoginViewProtocol) {
        // TODO:
    }
    
    func processLogin(formModel: LoginFormModel) {
        processLoginCalled = true
    }

}
