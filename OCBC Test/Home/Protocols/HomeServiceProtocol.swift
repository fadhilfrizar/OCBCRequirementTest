//
//  HomeServiceProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

protocol HomeServiceProtocol {
    func balance(completionHandler: @escaping (BalanceResponseModel?, HomeError?) -> Void)
    func transaction(completionHandler: @escaping (TransactionResponseModel?, HomeError?) -> Void)
}
