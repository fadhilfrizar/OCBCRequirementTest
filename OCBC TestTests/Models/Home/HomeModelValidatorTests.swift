//
//  HomeModelValidatorTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import XCTest
@testable import OCBC_Test

class HomeModelValidatorTests: XCTestCase {

    var sut: HomeModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeModelValidator()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    
    func testBalanceModelValidator_WhenValidTokenProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isTokenValid = sut.isAccessTokenValid(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU0MjQzNTYzLCJleHAiOjE2NTQyNTQzNjN9.aMqBUgFc4rP_rt940-D-utz9XKjdFMRRQwhq0qw2ZXA")
        
        // Assert
        XCTAssertTrue(isTokenValid, "The isTokenValid() should have returned TRUE for a valid token but returned FALSE")
    }
    
    func testBalanceModelValidator_WhenInvalidTokenProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isTokenValid = sut.isAccessTokenValid(accessToken: "")
        
        // Assert
        XCTAssertFalse(isTokenValid, "The isTokenValid() should have returned TRUE for a valid token but returned FALSE")
    }

}
