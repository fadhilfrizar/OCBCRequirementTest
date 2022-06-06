//
//  HomeControllerTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class HomeControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: HomeController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "homeController") as HomeController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    func testHomeController_WhenCreated_HasConnectedIBOutlet() throws {
        _ = try XCTUnwrap(sut.logoutButton, "The logoutButton is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.activityContainerView, "The activityContainerView is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.accountBalanceLabel, "The accountBalanceLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.balanceLabel, "The balanceLabel is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.accountNoLabel, "The accountNoLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.accountLabel, "The accountLabel is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.accountHolderLabel, "The accountHolderLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.accountHolderNameLabel, "The accountHolderNameLabel is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.transactionHistoryLabel, "The transactionHistoryLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.transactionCollectionView, "The transactionCollectionView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.indicator, "The indicator is not connected to an IBOutlet")
    }

    func testHomeController_WhenCreated_HasLogoutButtonAndAction() throws {
        // Arrange
        let logoutButton: UIButton = try XCTUnwrap(sut.logoutButton, "logout button does not have a referencing outlet")
        
        // Act
        let logoutButtonActions = try XCTUnwrap(logoutButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "logout button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(logoutButtonActions.count, 1)
        XCTAssertEqual(logoutButtonActions.first, "logoutButtonAction:", "There is no action with a name logoutButtonAction assigned to logout button")
    }
}
