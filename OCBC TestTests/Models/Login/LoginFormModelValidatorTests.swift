//
//  LoginFormModelValidatorTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class LoginFormModelValidatorTests: XCTestCase {

    var sut: LoginFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LoginFormModelValidator()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    
    // MARK: Username Validation Unit Tests
    func testLoginFormModelValidator_WhenValidUsernameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isUsernameValid = sut.isUsernameValid(username: "test")
        
        // Assert
        XCTAssertTrue(isUsernameValid, "The isUsernameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testLoginFormModelValidator_WhenTooShortUsernameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isUsernameValid = sut.isUsernameValid(username: "t")
        
        // Assert
        XCTAssertFalse(isUsernameValid, "The isUsernameValid() should have returned FALSE for a first name that is shorter than 2 characters but it has returned TRUE")
        
    }
    
    func testLoginFormModelValidator_WhenTooLongUsernameProvided_ShouldReturnFalse() {
        
        let isUsernameValid = sut.isUsernameValid(username: "testtestestestestestestestest")
        
        XCTAssertFalse(isUsernameValid, "The isUsernameValid() should have returned FALSE for a first name that is longer than 20 characters but it has returned TRUE")
    }
    
    // MARK: Password Validation
    func testLoginFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
        
    }
    
    func testLoginFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "1")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than 2 but it has returned TRUE")
        
    }
    
    func testLoginFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12391293812893128931298983129832")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than 20 but it has returned TRUE")
        
    }
    
    func testLoginFormModelValidator_WhenEmptyUsernamePasswordProvided_ShouldReturnTrue() {
        
        // Act
        let isUsernamePasswordNotEmpty = sut.isUsernamePasswordNotEmpty(username: "test", password: "asdasd")
        
        // Assert
        XCTAssertTrue(isUsernamePasswordNotEmpty, "The isUsernamePasswordNotEmpty() should have returned TRUE for a valid username and password not empty  but it has returned FALSE")
        
    }
    
    func testLoginFormModelValidator_WhenEmptyUsernamePasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isUsernamePasswordNotEmpty = sut.isUsernamePasswordNotEmpty(username: "", password: "")
        
        // Assert
        XCTAssertFalse(isUsernamePasswordNotEmpty, "The isUsernamePasswordNotEmpty() should have returned FALSE for username and password that is empty but it has returned TRUE")
        
    }

}
