//
//  CredentialProtocol.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

protocol CredentialProtocol {
    func saveCredential(response: LoginResponseModel)
    func logoutCredentials()
    func gettingAccessToken() -> String
    func gettingUsername() -> String
    func gettingAccountNo() -> String
}
