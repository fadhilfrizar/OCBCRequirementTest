//
//  HomeViewDelegateProcotol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func successfullGetBalance(response: BalanceResponseModel)
    func successfullGetTransaction(response: TransactionResponseModel)
    func errorHandler(error: HomeError)
    func startLoading()
    func finishLoading()
    func tokenIsValid(description: String)
}
