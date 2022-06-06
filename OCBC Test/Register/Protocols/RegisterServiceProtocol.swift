//
//  RegisterServiceProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

protocol RegisterServiceProtocol {
    func register(withForm formModel: RegisterFormRequestModel, completionHandler: @escaping (RegisterResponseModel?, RegisterError?) -> Void)
}
