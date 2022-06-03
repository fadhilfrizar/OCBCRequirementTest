//
//  BalanceModelValidator.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

class BalanceModelValidator: HomeModelValidatorProtocol {
    
    func isAccessTokenValid(accessToken: String) -> Bool {
        var returnValue = true
        if accessToken.isEmpty || accessToken.count == 0 {
            returnValue = false
        }
        return returnValue
    }
    
}
