//
//  LoginServiceProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

protocol LoginServiceProtocol {
    func login(withForm formModel: LoginFormRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginError?) -> Void)
}
