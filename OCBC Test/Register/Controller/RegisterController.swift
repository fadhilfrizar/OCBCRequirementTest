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
    
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    
    @IBOutlet weak var registerButton: LoginButton! {
        didSet {
            registerButton.titleText = "REGISTER"
            registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

//MARK: action button
extension RegisterController {
    @objc func registerButtonAction(_ sender: UIButton) {
        
    }
}
