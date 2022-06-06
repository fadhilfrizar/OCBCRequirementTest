//
//  HomePresenter.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    private var homeModelValidator: HomeModelValidatorProtocol
    private var webservice: HomeServiceProtocol
    private weak var delegate: HomeViewProtocol?
    
    required init(homeModelValidator: HomeModelValidatorProtocol, webservice: HomeServiceProtocol,
                  delegate: HomeViewProtocol) {
        self.homeModelValidator = homeModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    func processGetBalance(formModel: BalanceFormModel) {
        if !homeModelValidator.isAccessTokenValid(accessToken: formModel.accessToken) {
            self.delegate?.tokenIsValid(description: "Access token can not be empty")
            return
        }
        
        self.delegate?.startLoading()
        webservice.balance { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                self?.delegate?.finishLoading()
                return
            }
            
            if let responseModel = responseModel {
                self?.delegate?.successfullGetBalance(response: responseModel)
                self?.delegate?.finishLoading()
            }
        }
    }
    
    func processGetTransaction(request: TransactionRequestModel) {
        if !homeModelValidator.isAccessTokenValid(accessToken: request.accessToken) {
            self.delegate?.tokenIsValid(description: "Access token can not be empty")
            return
        }
        
        self.delegate?.startLoading()
        
        webservice.transaction { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                self?.delegate?.finishLoading()
                return
            }
            
            if let responseModel = responseModel {
                self?.delegate?.successfullGetTransaction(response: responseModel)
                self?.delegate?.finishLoading()
            }
        }
    }
    
}
