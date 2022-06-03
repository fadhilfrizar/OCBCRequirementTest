//
//  HomeController.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var logoutButton: LogoutButton! {
        didSet {
            logoutButton.titleText = "LOGOUT"
            logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var activityContainerView: UIView!
    
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var accountHolderNameLabel: UILabel!
    
    @IBOutlet weak var transactionHistoryLabel: UILabel!
    
    @IBOutlet weak var transactionCollectionView: UICollectionView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView! {
        didSet {
            indicator.isHidden = true
        }
    }
    
    let accessToken = Credential.shared.gettingAccessToken()
    let username = Credential.shared.gettingUsername()
    let accountNo = Credential.shared.gettingAccountNo()
    
    let storyboards = UIStoryboard(name: "Main", bundle: nil)
    var homePresenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if homePresenter == nil {
            let homeFormModelValidator = BalanceModelValidator()
            let balanceWebservice = HomeService(urlString: Const.BALANCE)
            
            homePresenter = HomePresenter(homeModelValidator: homeFormModelValidator, webservice: balanceWebservice, delegate: self)
        }
        
        getBalanceData()
    }
    
    override func viewDidLayoutSubviews() {
        self.activityContainerView.roundCorners([.topRight, .bottomRight], radius: 18)
    }
    
    func getBalanceData() {
        let balanceFormModel = BalanceFormModel(accessToken: self.accessToken)
        homePresenter?.processGetBalance(formModel: balanceFormModel)
    }
}


//MARK: action button
extension HomeController {
    @objc func logoutButtonAction(_ sender: LogoutButton) {
        Credential.shared.logoutCredentials()
        
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController") as! LoginController
        self.view.window?.rootViewController = loginController

        self.view.window?.makeKeyAndVisible()
    }
}


extension HomeController: HomeViewDelegateProtocol {
    func successfullGetBalance(response: BalanceResponseModel) {
        //MARK: getting data balance
        DispatchQueue.main.async {
            self.balanceLabel.text = "SGD \(response.balance)"
            self.accountLabel.text = self.accountNo
            self.accountHolderNameLabel.text = self.username
        }
    }
    
    func errorHandler(error: BalanceError) {
        DispatchQueue.main.async {
            self.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 12.0))
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
    
    func tokenIsValid(description: String) {
        DispatchQueue.main.async {
            self.showToast(message: description, font: .systemFont(ofSize: 12.0))
        }
    }
    
    
}
