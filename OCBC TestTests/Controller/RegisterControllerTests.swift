//
//  RegisterControllerTests.swift
//  OCBC TestTests
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import XCTest
@testable import OCBC_Test

class RegisterControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: RegisterController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "registerController") as RegisterController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testRegisterController_WhenCreated_HasConnectedIBOutlet() throws {
        _ = try XCTUnwrap(sut.registerLabel, "The registerLabel is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.usernameContainerView, "The usernameContainerView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.usernameLabel, "The usernameLabel is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.passwordContainerView, "The passwordContainerView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.passwordLabel, "The passwordLabel is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.confirmPasswordContainerView, "The confirmPasswordContainerView is not connected to an IBOutlet")
        _ = try XCTUnwrap(sut.confirmPasswordLabel, "The confirmPasswordLabel is not connected to an IBOutlet")

        _ = try XCTUnwrap(sut.passwordErrorMessageLabel, "The passwordErrorMessageLabel is not connected to an IBOutlet")
        
        _ = try XCTUnwrap(sut.registerButton, "The registerButton is not connected to an IBOutlet")
    }
    
    func testRegisterController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        let usernameTextField = try XCTUnwrap(sut.usernameTextField, "The usernameTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let confirmPasswordTextField = try XCTUnwrap(sut.confirmPasswordTextField, "The confirmPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(usernameTextField.text, "", "username text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(confirmPasswordTextField.text, "", "confirm password text field was not empty when the view controller initially loaded")
    }

    func testRegisterController_WhenCreated_HasRegisterButtonAndAction() throws {
        // Arrange
        let registerButton: UIButton = try XCTUnwrap(sut.registerButton, "register button does not have a referencing outlet")
        
        // Act
        let registerButtonActions = try XCTUnwrap(registerButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "register button does not have any actions assigned to it")

        // Assert
        XCTAssertEqual(registerButtonActions.count, 1)
        XCTAssertEqual(registerButtonActions.first, "registerButtonAction:", "There is no action with a name registerButtonAction assigned to register button")
    }
}
