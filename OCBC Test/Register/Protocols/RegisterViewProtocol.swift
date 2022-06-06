//
//  RegisterViewProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

protocol RegisterViewProtocol: AnyObject {
    func successfullRegister(response: RegisterResponseModel)
    func errorHandler(error: RegisterError)
    func startLoading()
    func finishLoading()
    func passwordNotMatch(description: String)
}
