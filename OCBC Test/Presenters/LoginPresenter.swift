//
//  LoginPresenter.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation


class LoginPresenter: LoginPresenterProtocol {
    
    private var formModelValidator: LoginModelValidatorProtocol
    private var webservice: LoginServiceProtocol
    private weak var delegate: LoginViewDelegateProtocol?
    
    required init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginServiceProtocol,
                  delegate: LoginViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processLogin(formModel: LoginFormModel) {
        
        if !formModelValidator.isUsernameValid(username: formModel.username) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        let requestModel = LoginFormRequestModel(username: formModel.username, password: formModel.password)
        
        webservice.login(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successfullLogin()
            }
        }
        
    }
}
