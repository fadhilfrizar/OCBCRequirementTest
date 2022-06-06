//
//  MockHomeModelValidator.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
@testable import OCBC_Test

class MockHomeModelValidator: HomeModelValidatorProtocol {
   
    var isAccessTokenValid: Bool = false

    func isAccessTokenValid(accessToken: String) -> Bool {
        isAccessTokenValid = true
        return isAccessTokenValid
    }
    
}
