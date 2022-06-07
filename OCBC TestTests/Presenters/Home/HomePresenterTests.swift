//
//  HomePresenterTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
import XCTest
@testable import OCBC_Test

class HomePresenterTests: XCTestCase {
    
    var balanceFormModel: BalanceFormModel!
    var transactionRequestModel: TransactionRequestModel!
    
    var mockHomeModelValidator: MockHomeModelValidator!
    var mockHomeService: MockHomeService!
    var sut: HomePresenter!
    var mockHomeViewDelegate: MockHomeViewDelegate!

    var accessToken: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTZlNzNlMDYyYWY0ZGQ5YmMyYzYxMWQiLCJ1c2VybmFtZSI6InRlc3QiLCJhY2NvdW50Tm8iOiIyOTcwLTExMS0zNjQ4IiwiaWF0IjoxNjU0MTkwNjYzLCJleHAiOjE2NTQyMDE0NjN9.zx-_UvSJ8mjuNfUlJq6slWmA8XytjJ-cXI6TR4AR2bI"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockHomeModelValidator = MockHomeModelValidator()
        mockHomeService = MockHomeService()
        mockHomeViewDelegate = MockHomeViewDelegate()
        sut = HomePresenter(homeModelValidator: mockHomeModelValidator, webservice: mockHomeService, delegate: mockHomeViewDelegate)
        
        balanceFormModel = BalanceFormModel(accessToken: accessToken)
        
        transactionRequestModel = TransactionRequestModel(accessToken: accessToken)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        loginFormModel = nil
        mockHomeModelValidator = nil
        mockHomeService = nil
        mockHomeViewDelegate = nil
        sut = nil
    }
    
    func testHomePresenter_WhenBalanceInformationProvided_WillValidate() {
        // Arrange
        
        // Act
        sut.processGetBalance(formModel: self.balanceFormModel)
        
        // Assert
        XCTAssertTrue(mockHomeModelValidator.isAccessTokenValid, "token was not validated")
    }
    
    func testHomePresenter_WhenTransactionInformationProvided_WillValidate() {
        // Arrange
        
        // Act
        sut.processGetTransaction(request: transactionRequestModel)
        
        // Assert
        XCTAssertTrue(mockHomeModelValidator.isAccessTokenValid, "token was not validated")
    }
    
    func testHomePresenter_WhenBalanceGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processGetBalance(formModel: balanceFormModel)
        
        // Assert
        XCTAssertTrue(mockHomeService.isBalanceMethodCalled, "The balance() method was not called in the HomeService class")
    }
    
    func testHomePresenter_WhenTransactionGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processGetTransaction(request: transactionRequestModel)
        
        // Assert
        XCTAssertTrue(mockHomeService.isTransactionMethodCalled, "The transaction() method was not called in the HomeService class")
    }

    func testHomePresenter_WhenBalanceOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulBalance() method to be called")
        mockHomeViewDelegate.expectation = myExpectation
        
        // Act
        sut.processGetBalance(formModel: balanceFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockHomeViewDelegate.successfulBalanceCounter, 1, "The successfulBalance() method was called more than one time")
    }
    
    func testHomePresenter_WhenTransactionOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulTransaction() method to be called")
        mockHomeViewDelegate.expectation = myExpectation
        
        // Act
        sut.processGetTransaction(request: transactionRequestModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockHomeViewDelegate.successfulTransactionCounter, 1, "The successfulBalance() method was called more than one time")
    }
    
    func testHomePresenter_WhenBalanceOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockHomeViewDelegate.expectation = errorHandlerExpectation
        mockHomeService.balanceShouldReturnError = true
        
        // Act
        sut.processGetBalance(formModel: balanceFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockHomeViewDelegate.successfulBalanceCounter, 0)
        XCTAssertEqual(mockHomeViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockHomeViewDelegate.homeError)
    }
    
    func testHomePresenter_WhenTransactionOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockHomeViewDelegate.expectation = errorHandlerExpectation
        mockHomeService.transactionShouldReturnError = true
        
        // Act
        sut.processGetTransaction(request: transactionRequestModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockHomeViewDelegate.successfulTransactionCounter, 0)
        XCTAssertEqual(mockHomeViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockHomeViewDelegate.homeError)
    }

}
