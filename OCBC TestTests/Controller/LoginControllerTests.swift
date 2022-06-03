//
//  LoginControllerTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class LoginControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: LoginController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "loginController") as LoginController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    
    func testLoginController_WhenCreated_HasConnectedIBOutlet() throws {
        _ = try XCTUnwrap(sut.loginLabel, "The loginLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.usernameContainerView, "The usernameContainerView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.usernameLabel, "The usernameLabel is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.usernameErrorMessageLabel, "The usernameErrorMessageLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.usernameErrorMessageHeightConstraint, "The usernameErrorMessageHeightConstraint is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.passwordContainerView, "The passwordContainerView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.passwordLabel, "The passwordLabel is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.passwordErrorMessageLabel, "The passwordErrorMessageLabel is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.loginButton, "The loginButton is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.registerButton, "The registerButton is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.indicator, "The indicator is not connected to an IBOutlet")
    }

    
    func testLoginController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        let usernameTextField = try XCTUnwrap(sut.usernameTextField, "The usernameTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(usernameTextField.text, "", "username text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "password text field was not empty when the view controller initially loaded")
    }
    
    
    func testLoginController_WhenCreated_HasLoginButtonAndAction() throws {
        // Arrange
        let loginButton: UIButton = try XCTUnwrap(sut.loginButton, "login button does not have a referencing outlet")
        
        // Act
        let loginButtonActions = try XCTUnwrap(loginButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "login button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(loginButtonActions.count, 1)
        XCTAssertEqual(loginButtonActions.first, "loginButtonAction:", "There is no action with a name loginButtonAction assigned to login button")
    }
    
    func testLoginController_WhenCreated_HasRegisterButtonAndAction() throws {
        // Arrange
        let registerButton: UIButton = try XCTUnwrap(sut.registerButton, "register button does not have a referencing outlet")
        
        // Act
        let registerButtonActions = try XCTUnwrap(registerButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "register button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(registerButtonActions.count, 1)
        XCTAssertEqual(registerButtonActions.first, "registerButtonAction:", "There is no action with a name registerButtonAction assigned to register button")
    }
    
    func testLoginController_WhenLoginButtonTapped_InvokesLoginProcess() {
        // Arrange
        let mockLoginModelValidator = MockLoginModelValidator()
        let mockLoginService = MockLoginService()
        let mockLoginViewDelegate = MockLoginViewDelegate()
        
        let mockLoginPresenter = MockLoginPresenter(formModelValidator: mockLoginModelValidator, webservice: mockLoginService, delegate: mockLoginViewDelegate)
        
        sut.loginPresenter = mockLoginPresenter
        
        // Act
        sut.loginButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockLoginPresenter.processLoginCalled, "The processLoginCalled() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
    

}





