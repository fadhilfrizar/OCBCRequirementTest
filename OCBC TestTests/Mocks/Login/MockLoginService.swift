//
//  MockLoginService.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
@testable import OCBC_Test

class MockLoginService: LoginServiceProtocol {
 
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    var isStatusFailed: Bool = false
    var isInvalidRequestURLString: Bool = false
    var isInvalidRequestMessageError: Bool = false
 
    func login(withForm formModel: LoginFormRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            
            if isStatusFailed {
                let responseModel = LoginResponseModel(status: "failed", token: "", username: "", accountNo: "")
                completionHandler(responseModel, nil)
                return
            }
            
            if isInvalidRequestURLString {
                completionHandler(nil, LoginError.invalidRequestURLString)
                return
            }
            
            if isInvalidRequestMessageError {
                completionHandler(nil, LoginError.failedRequest(description: "Login request was not successful"))
                return
            }
            
            completionHandler(nil, LoginError.failedRequest(description: "Signup request was not successful"))
            
        } else {
            let responseModel = LoginResponseModel(status: "success", token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU0MTkwNjYzLCJleHAiOjE2NTQyMDE0NjN9.zx-_UvSJ8mjuNfUlJq6slWmA8XytjJ-cXI6TR4AR2bI", username: "test", accountNo: "2970-111-3648")
            completionHandler(responseModel, nil)
        }
 
    }

}
