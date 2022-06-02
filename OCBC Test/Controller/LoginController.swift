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
    var loginPresenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if loginPresenter == nil {
            let loginFormModelValidator = LoginFormModelValidator()
            let webservice = LoginService(urlString: Const.LOGIN)
            
            loginPresenter = LoginPresenter(formModelValidator: loginFormModelValidator, webservice: webservice, delegate: self)
        }
    }


}

//MARK: action button
extension LoginController {
    @objc func loginButtonAction(_ sender: UIButton) {
        let loginFormModel = LoginFormModel(username: usernameTextField.text ?? "",
                                            password: passwordTextField.text ?? "")
        
        loginPresenter?.processLogin(formModel: loginFormModel)

    }
    
    @objc func registerButtonAction(_ sender: UIButton) {
        let controller = self.storyboards.instantiateViewController(withIdentifier: "registerController") as! RegisterController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


extension LoginController: LoginViewDelegateProtocol {
    func successfullLogin() {
        // TODO:
        
    }
    
    func errorHandler(error: LoginError) {
        // TODO:
    }
    
    
}
