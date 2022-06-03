//
//  CustomUserDefaults.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
import UIKit

class Credential {
    
    static let shared = Credential()
    let defaults = UserDefaults.standard
    
    func saveCredential(response: LoginResponseModel) {
        defaults.set(response.token, forKey: Const.UserCredential.CREDENTIAL_ACCESS_TOKEN)
        defaults.set(response.username, forKey: Const.UserCredential.CREDENTIAL_USERNAME)
        defaults.set(response.accountNo, forKey: Const.UserCredential.CREDENTIAL_ACCOUNT_NO)
        defaults.synchronize()
    }
    
    func logoutCredentials() {
        let keysToRemove = [
            Const.UserCredential.CREDENTIAL_ACCESS_TOKEN,
            Const.UserCredential.CREDENTIAL_USERNAME,
            Const.UserCredential.CREDENTIAL_ACCOUNT_NO,
        ]

        for key in keysToRemove {
            UserDefaults.standard.set("", forKey: key)
        }
        
        defaults.set("", forKey: Const.UserCredential.CREDENTIAL_ACCESS_TOKEN)
        defaults.set("", forKey: Const.UserCredential.CREDENTIAL_USERNAME)
        defaults.set("", forKey: Const.UserCredential.CREDENTIAL_ACCOUNT_NO)

        defaults.synchronize()
    }
    
    func gettingAccessToken() -> String {
        guard let accessToken = defaults.string(forKey: Const.UserCredential.CREDENTIAL_ACCESS_TOKEN) else { return "" }
        
        return accessToken
    }
    
    func gettingUsername() -> String {
        guard let username = defaults.string(forKey: Const.UserCredential.CREDENTIAL_USERNAME) else { return "" }
        return username
    }
    
    func gettingAccountNo() -> String {
        guard let accountNo = defaults.string(forKey: Const.UserCredential.CREDENTIAL_ACCOUNT_NO) else { return "" }
        return accountNo
    }
}
