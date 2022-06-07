//
//  RegisterPresenter.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol {
    
    private var formModelValidator: RegisterModelValidatorProtocol
    private var webservice: RegisterServiceProtocol
    private weak var delegate: RegisterViewProtocol?
    
    required init(formModelValidator: RegisterModelValidatorProtocol, webservice: RegisterServiceProtocol,
                  delegate: RegisterViewProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processRegister(formModel: RegisterFormModel) {
        
        if !formModelValidator.isConfirmPasswordValid(password: formModel.password, confirmPassword: formModel.repeatPassword) {
            self.delegate?.message(description: "Confirm password not match")
            return
        }
        
        if !formModelValidator.isUsernameValid(username: formModel.username) {
            self.delegate?.message(description: "Username is invalid")
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            self.delegate?.message(description: "Password is invalid")
            return
        }
        
        self.delegate?.startLoading()
        let requestModel = RegisterFormRequestModel(username: formModel.username, password: formModel.password)
        webservice.register(withForm: requestModel) { [weak self] responseModel, error in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                self?.delegate?.finishLoading()
                return
            }
            
            if let responseModel = responseModel {
                self?.delegate?.successfullRegister(response: responseModel)
                self?.delegate?.finishLoading()
            }
            
        }
    }
}
