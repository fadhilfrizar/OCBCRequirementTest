//
//  MockHomePresenter.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
@testable import OCBC_Test

class MockHomePresenter: HomePresenterProtocol {
    
    var processBalanceCalled: Bool = false
    var processTransactionCalled: Bool = false
    
    required init(homeModelValidator: HomeModelValidatorProtocol, webservice: HomeServiceProtocol, delegate: HomeViewProtocol) {
        // TODO: 
    }
    
    func processGetBalance(formModel: BalanceFormModel) {
        processBalanceCalled = true
    }
    
    func processGetTransaction(request: TransactionRequestModel) {
        processTransactionCalled = true
    }
    
    

}
