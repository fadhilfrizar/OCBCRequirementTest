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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: action button
extension RegisterController {
    @objc func registerButtonAction(_ sender: UIButton) {
        
    }
}
