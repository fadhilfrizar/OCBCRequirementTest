//
//  RegisterPresenterTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import XCTest
@testable import OCBC_Test

class RegisterPresenterTests: XCTestCase {
    
    var registerFormModel: RegisterFormModel!
    var mockRegisterModelValidator: MockRegisterModelValidator!
    var mockRegisterService: MockRegisterService!
    var sut: RegisterPresenter!
    var mockRegisterViewDelegate: MockRegisterViewDelegate!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        registerFormModel = RegisterFormModel(username: "test", password: "asdasd", repeatPassword: "asdasd")
        mockRegisterModelValidator = MockRegisterModelValidator()
        mockRegisterService = MockRegisterService()
        mockRegisterViewDelegate = MockRegisterViewDelegate()
        sut = RegisterPresenter(formModelValidator: mockRegisterModelValidator, webservice: mockRegisterService, delegate: mockRegisterViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        registerFormModel = nil
        mockRegisterModelValidator = nil
        mockRegisterService = nil
        mockRegisterViewDelegate = nil
        sut = nil
    }
    
    func testRegisterPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.processRegister(formModel: registerFormModel)
        
        // Assert
        XCTAssertTrue(mockRegisterModelValidator.isUsernameValidated,"username was not validated")
        XCTAssertTrue(mockRegisterModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockRegisterModelValidator.isConfirmPasswordValidated, "Password and Confirm Password was not match")
        
    }
    
    func testRegisterPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processRegister(formModel: registerFormModel)
        
        
        // Assert
        XCTAssertTrue(mockRegisterService.isRegisterMethodCalled, "The Register() method was not called in the RegisterWebService class")
    }
    
    func testRegisterPresenter_WhenRegisterOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulLogin() method to be called")
        mockRegisterViewDelegate.expectation = myExpectation
        
        // Act
        sut.processRegister(formModel: registerFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockRegisterViewDelegate.successfulRegisterCounter, 1, "The successfulRegister() method was called more than one time")
    }
    
    
    func testRegisterPresenter_WhenLoginOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockRegisterViewDelegate.expectation = errorHandlerExpectation
        mockRegisterService.shouldReturnError = true
        
        // Act
        sut.processRegister(formModel: registerFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockRegisterViewDelegate.successfulRegisterCounter, 0)
        XCTAssertEqual(mockRegisterViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockRegisterViewDelegate.signupError)
    }
    


}
