//
//  LoginPresenterTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class LoginPresenterTests: XCTestCase {
    
    var loginFormModel: LoginFormModel!
    var mockLoginModelValidator: MockLoginModelValidator!
    var mockLoginService: MockLoginService!
    var sut: LoginPresenter!
    var mockLoginViewDelegate: MockLoginViewDelegate!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginFormModel = LoginFormModel(username: "test", password: "asdasd")
        mockLoginModelValidator = MockLoginModelValidator()
        mockLoginService = MockLoginService()
        mockLoginViewDelegate = MockLoginViewDelegate()
        sut = LoginPresenter(formModelValidator: mockLoginModelValidator, webservice: mockLoginService, delegate: mockLoginViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginFormModel = nil
        mockLoginModelValidator = nil
        mockLoginService = nil
        mockLoginViewDelegate = nil
        sut = nil
    }
    
    func testLoginPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.processLogin(formModel: loginFormModel)
        
        // Assert
        XCTAssertTrue(mockLoginModelValidator.isUsernameValidated,"username was not validated")
        XCTAssertTrue(mockLoginModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockLoginModelValidator.isUsernameAndPasswordValidated, "Username and Password was not validated")
        
    }
    
    func testLoginPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processLogin(formModel: loginFormModel)
        
        
        // Assert
        XCTAssertTrue(mockLoginService.isSignupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func testLoginPresenter_WhenLoginOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulLogin() method to be called")
        mockLoginViewDelegate.expectation = myExpectation
        
        // Act
        sut.processLogin(formModel: loginFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockLoginViewDelegate.successfulSignupCounter, 1, "The successfulLogin() method was called more than one time")
    }
    
    
    func testLoginPresenter_WhenLoginOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockLoginViewDelegate.expectation = errorHandlerExpectation
        mockLoginService.shouldReturnError = true
        
        // Act
        sut.processLogin(formModel: loginFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockLoginViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockLoginViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockLoginViewDelegate.signupError)
    }
    


}
