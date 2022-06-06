//
//  MockRegisterService.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
@testable import OCBC_Test

class MockRegisterService: RegisterServiceProtocol {
 
    var isRegisterMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    var isStatusFailed: Bool = false
    var isInvalidRequestURLString: Bool = false
 
    func register(withForm formModel: RegisterFormRequestModel, completionHandler: @escaping (RegisterResponseModel?, RegisterError?) -> Void) {
        
        isRegisterMethodCalled = true
        
        if shouldReturnError {
            
            if isStatusFailed {
                let responseModel = RegisterResponseModel(status: "failed", token: "")
                completionHandler(responseModel, nil)
                return
            }
            
            if isInvalidRequestURLString {
                completionHandler(nil, RegisterError.invalidRequestURLString)
                return
            }
            
            completionHandler(nil, RegisterError.failedRequest(description: "Register request was not successful"))
            
        } else {
            let responseModel = RegisterResponseModel(status: "success", token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU0MTkwNjYzLCJleHAiOjE2NTQyMDE0NjN9.zx-_UvSJ8mjuNfUlJq6slWmA8XytjJ-cXI6TR4AR2bI")
            completionHandler(responseModel, nil)
        }
 
    }

}
