//
//  HomeViewDelegateProcotol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

protocol HomeViewDelegateProtocol: AnyObject {
    func successfullGetBalance(response: BalanceResponseModel)
    func errorHandler(error: BalanceError)
    func startLoading()
    func finishLoading()
    func tokenIsValid(description: String)
}
