//
//  HomeServiceTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 05/06/22.
//

import Foundation
@testable import OCBC_Test
import XCTest

class HomeServiceTests: XCTestCase {
    
    var sut: MockHomeService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockHomeService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testHomeService_WhenBalanceGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"success\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Home Service Balance Response Expectation")
        
        // Act
        sut.balance { balanceResponseModel, error in
            
            // Assert
            XCTAssertEqual(balanceResponseModel?.status, "success")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    
    func testHomeService_WhenTransactionsGivenSuccessfullResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"success\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Home Service transaction Response Expectation")
        
        // Act
        sut.transaction { transactionResponseModel, error in
            
            // Assert
            XCTAssertEqual(transactionResponseModel?.status, "success")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    
    func testHomeService_WhenBalanceGivenErrorfullResponse_ReturnsFailed() {
        // Arrange
        let jsonString = "{\"status\":\"failed\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Home Service Balance Response Expectation")
        sut.balanceShouldReturnError = true
        sut.isBalanceStatusFailed = true
        // Act
        sut.balance { (balanceResponseModel, error) in
            
            // Assert
            //"{\"status\":\"failed\"}"
            XCTAssertEqual(balanceResponseModel?.status, "failed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    
    func testHomeService_WhenTransactionGivenErrorfullResponse_ReturnsFailed() {
        // Arrange
        let jsonString = "{\"status\":\"failed\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Home Service Transaction Response Expectation")
        sut.transactionShouldReturnError = true
        sut.isTransactionStatusFailed = true
        // Act
        sut.transaction { (transactionResponseModel, error) in
            
            // Assert
            //"{\"status\":\"failed\"}"
            XCTAssertEqual(transactionResponseModel?.status, "failed")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    
    
    func testHomeService_WhenBalanceEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = MockHomeService()
        sut.balanceShouldReturnError = true
        sut.isBalanceInvalidRequestURLString = true
        // Act
        sut.balance { (balanceResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, HomeError.invalidRequestURLString, "The login() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(balanceResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
    }
    
    func testHomeService_WhenTransactionEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = MockHomeService()
        sut.transactionShouldReturnError = true
        sut.isTransactionInvalidRequestURLString = true
        // Act
        sut.transaction { (transactionResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, HomeError.invalidRequestURLString, "The login() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(transactionResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
    }

    func testHomeService_WhenBalanceURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "Balance request was not successful"
        MockURLProtocol.error = HomeError.failedRequest(description:errorDescription)
        sut.balanceShouldReturnError = true

        // Act
        sut.balance { (balanceResponseModel, error) in
            // Assert
            XCTAssertEqual(error, HomeError.failedRequest(description:errorDescription), "The balance() method did not return an expecter error for the Failed Request")
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    
    func testHomeService_WhenTransactionURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "Transaction request was not successful"
        MockURLProtocol.error = HomeError.failedRequest(description:errorDescription)
        sut.transactionShouldReturnError = true

        // Act
        sut.transaction { (transactionResponseModel, error) in
            // Assert
            XCTAssertEqual(error, HomeError.failedRequest(description:errorDescription), "The transaction() method did not return an expecter error for the Failed Request")
            // XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 1)
        
    }
    

}
