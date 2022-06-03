//
//  LoginServiceTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class LoginServiceTests: XCTestCase {
    
    var sut: LoginService!
    var loginFormRequestModel: LoginFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = LoginService(urlString: Const.LOGIN, urlSession: urlSession)
        loginFormRequestModel = LoginFormRequestModel(username: "test", password: "asdasd")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        loginFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func disableTestLoginService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"success\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Login Service Response Expectation")
        
        // Act
        sut.login(withForm: loginFormRequestModel) { (loginResponseModel, error) in
            
            // Assert
            //"{\"status\":\"success\"}"
            XCTAssertEqual(loginResponseModel?.status, "success")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func disableTestLoginService_WhenGivenErrorfullResponse_ReturnsFailed() {
        // Arrange
        let jsonString = "{\"status\":\"failed\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Login Service Response Expectation")
        
        // Act
        sut.login(withForm: loginFormRequestModel) { (loginResponseModel, error) in
            
            // Assert
            //"{\"status\":\"failed\"}"
            XCTAssertEqual(loginResponseModel?.status, "failed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testLoginService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = LoginService(urlString: "")
        
        // Act
        sut.login(withForm: loginFormRequestModel) { (loginResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, LoginError.invalidRequestURLString, "The login() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(loginResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testLoginService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "The operation couldn’t be completed. (OCBC_Test.LoginError error 0.)"
        MockURLProtocol.error = LoginError.failedRequest(description:errorDescription)
        
        // Act
        sut.login(withForm: loginFormRequestModel) { (loginResponseModel, error) in
            // Assert
            XCTAssertEqual(error, LoginError.failedRequest(description:errorDescription), "The login() method did not return an expecter error for the Failed Request")
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    

}
