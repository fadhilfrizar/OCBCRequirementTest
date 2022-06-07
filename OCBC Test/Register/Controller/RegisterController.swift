//
//  RegisterController.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var registerLabel: UILabel!
    
    @IBOutlet weak var usernameContainerView: TextFieldContainerView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordContainerView: TextFieldContainerView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordContainerView: TextFieldContainerView!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var passwordErrorMessageLabel: UILabel! {
        didSet {
            passwordErrorMessageLabel.isHidden = true
        }
    }
    
    @IBOutlet weak var registerButton: LoginButton! {
        didSet {
            registerButton.titleText = "REGISTER"
            registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        }
    }
    @IBOutlet weak var indicator: UIActivityIndicatorView! {
        didSet {
            indicator.isHidden = true
        }
    }
    
    let storyboards = UIStoryboard(name: "Main", bundle: nil)
    var registerPresenter: RegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if registerPresenter == nil {
            let registerFormModelValidator = RegisterFormModelValidator()
            let webservice = RegisterService(urlString: Const.REGISTER)
            
            registerPresenter = RegisterPresenter(formModelValidator: registerFormModelValidator, webservice: webservice, delegate: self)
        }
    }

}

//MARK: action button
extension RegisterController {
    @objc func registerButtonAction(_ sender: UIButton) {
        let registerFormModel = RegisterFormModel(username: usernameTextField.text ?? "",
                                                  password: passwordTextField.text ?? "",
                                                  repeatPassword: confirmPasswordTextField.text ?? "")
        
        registerPresenter?.processRegister(formModel: registerFormModel)
    }
}


extension RegisterController: RegisterViewProtocol {
    func successfullRegister(response: RegisterResponseModel) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func errorHandler(error: RegisterError) {
        // TODO:
        DispatchQueue.main.async {
            self.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 12.0))
        }
    }
    
    func message(description: String) {
        DispatchQueue.main.async {
            self.passwordErrorMessageLabel.isHidden = false
            self.passwordErrorMessageLabel.text = description
        }
    }
    
    func startLoading() {
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
        }
        
    }
    
    func finishLoading() {
        DispatchQueue.main.async {
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
        }
        
    }
    
    
}
