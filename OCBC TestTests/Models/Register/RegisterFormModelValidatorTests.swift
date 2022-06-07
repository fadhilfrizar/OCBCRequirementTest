//
//  RegisterFormModelValidatorTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation
import XCTest
@testable import OCBC_Test

class RegisterFormModelValidatorTests: XCTestCase {

    var sut: RegisterFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RegisterFormModelValidator()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    
    // MARK: Username Validation Unit Tests
    func testRegisterFormModelValidator_WhenValidUsernameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isUsernameValid = sut.isUsernameValid(username: "test")
        
        // Assert
        XCTAssertTrue(isUsernameValid, "The isUsernameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testRegisterFormModelValidator_WhenTooShortUsernameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isUsernameValid = sut.isUsernameValid(username: "t")
        
        // Assert
        XCTAssertFalse(isUsernameValid, "The isUsernameValid() should have returned FALSE for a first name that is shorter than 2 characters but it has returned TRUE")
        
    }
    
    func testRegisterFormModelValidator_WhenTooLongUsernameProvided_ShouldReturnFalse() {
        
        let isUsernameValid = sut.isUsernameValid(username: "testestestesttestestest")
        
        XCTAssertFalse(isUsernameValid, "The isUsernameValid() should have returned FALSE for a first name that is longer than 20 characters but it has returned TRUE")
    }
    
    // MARK: Password Validation
    func testRegisterFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
        
    }
    
    func testRegisterFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "1")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than 2 but it has returned TRUE")
        
    }
    
    func testRegisterFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "1234567890123456712312312")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than 20 but it has returned TRUE")
        
    }
    
    func testRegisterFormModelValidator_WhenPasswordMatch_ShouldReturnTrue() {
        
        //Act
        let isPasswordMatch = sut.isConfirmPasswordValid(password: "123456", confirmPassword: "123456")
        
        // Assert
        XCTAssertTrue(isPasswordMatch, "The isPasswordMatch() should have returned TRUE for a match password but it has returned FALSE")
    }
    
    func testRegisterFormModelValidator_WhenPasswordNotMatch_ShouldReturnFalse() {
        // Act
        let isPasswordMatch = sut.isConfirmPasswordValid(password: "1234567", confirmPassword: "123456")
        
        // Assert
        XCTAssertFalse(isPasswordMatch, "The isPasswordMatch() should have returned FALSE for a match password that is the same but it has returned TRUE")
        
    }
    
    

}



