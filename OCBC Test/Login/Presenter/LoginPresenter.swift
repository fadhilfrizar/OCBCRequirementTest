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
    private weak var delegate: LoginViewProtocol?
    
    required init(formModelValidator: LoginModelValidatorProtocol, webservice: LoginServiceProtocol,
                  delegate: LoginViewProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processLogin(formModel: LoginFormModel) {
        
        
        if !formModelValidator.isUsernamePasswordNotEmpty(username: formModel.username, password: formModel.password) {
            self.delegate?.usernameAndPasswordEmpty(description: "Username and password is required")
            return
        }
        
        if !formModelValidator.isUsernameValid(username: formModel.username) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        let requestModel = LoginFormRequestModel(username: formModel.username, password: formModel.password)
        self.delegate?.startLoading()
        webservice.login(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                self?.delegate?.finishLoading()
                return
            }
            
            if let responseModel = responseModel {
                self?.delegate?.successfullLogin(response: responseModel)
                self?.delegate?.finishLoading()
            }
        }
    }
}
