//
//  HomePresenterProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    init(homeModelValidator: HomeModelValidatorProtocol, webservice: HomeServiceProtocol,
         delegate: HomeViewDelegateProtocol)
    func processGetBalance(formModel: BalanceFormModel)
}
