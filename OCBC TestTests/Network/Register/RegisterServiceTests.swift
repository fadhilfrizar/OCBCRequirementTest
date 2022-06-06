//
//  RegisterServiceTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
@testable import OCBC_Test
import XCTest

class RegisterServiceTests: XCTestCase {
    
    var sut: MockRegisterService!
    var registerFormRequestModel: RegisterFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockRegisterService()
        registerFormRequestModel = RegisterFormRequestModel(username: "testing29", password: "1234567")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        registerFormRequestModel = nil
    }
    
    func testRegisterService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"success\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Register Service Response Expectation")
        
        // Act
        sut.register(withForm: registerFormRequestModel) { (responseModel, error) in
            
            // Assert
            //"{\"status\":\"success\"}"
            XCTAssertEqual(responseModel?.status, "success")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testRegisterService_WhenGivenErrorfullResponse_ReturnsFailed() {
        // Arrange
        let jsonString = "{\"status\":\"failed\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Register Service Response Expectation")
        sut.shouldReturnError = true
        sut.isStatusFailed = true
        // Act
        sut.register(withForm: registerFormRequestModel) { (responseModel, error) in
            
            // Assert
            //"{\"status\":\"failed\"}"
            XCTAssertEqual(responseModel?.status, "failed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testRegisterService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut.shouldReturnError = true
        sut.isInvalidRequestURLString = true
        // Act
        sut.register(withForm: registerFormRequestModel) { (responseModel, error) in
            
            // Assert
            XCTAssertEqual(error, RegisterError.invalidRequestURLString, "The Register() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(responseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testRegisterService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "Register request was not successful"
        MockURLProtocol.error = RegisterError.failedRequest(description:errorDescription)
        sut.shouldReturnError = true
        // Act
        sut.register(withForm: registerFormRequestModel) { (responseModel, error) in
            // Assert
            XCTAssertEqual(error, RegisterError.failedRequest(description:errorDescription), "The login() method did not return an expecter error for the Failed Request")
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    

}
