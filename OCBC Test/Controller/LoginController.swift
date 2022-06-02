//
//  ViewController.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var usernameContainerView: TextFieldContainerView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameErrorMessageLabel: UILabel! {
        didSet {
            usernameErrorMessageLabel.isHidden = true
        }
    }
    @IBOutlet weak var usernameErrorMessageHeightConstraint: NSLayoutConstraint! {
        didSet {
            usernameErrorMessageHeightConstraint.constant = 0
        }
    }
    
    @IBOutlet weak var passwordContainerView: TextFieldContainerView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel! {
        didSet {
            passwordErrorMessageLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var loginButton: LoginButton! {
        didSet {
            loginButton.titleText = "LOGIN"
            loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var registerButton: RegisterButton! {
        didSet {
            registerButton.titleText = "REGISTER"
            registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        }
    }
    
    let storyboards = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//MARK: action button
extension LoginController {
    @objc func loginButtonAction(_ sender: UIButton) {
        let controller = self.storyboards.instantiateViewController(withIdentifier: "homeController") as! HomeController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func registerButtonAction(_ sender: UIButton) {
        let controller = self.storyboards.instantiateViewController(withIdentifier: "registerController") as! RegisterController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
