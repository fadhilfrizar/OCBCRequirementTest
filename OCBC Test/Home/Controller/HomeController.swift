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
    
    @IBOutlet weak var transactionCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var transactionCollectionView: UICollectionView! {
        didSet {
            transactionCollectionView.delegate = self
            transactionCollectionView.dataSource = self
            
            transactionCollectionView.register(UINib(nibName: "TransactionHistoryCell", bundle: nil), forCellWithReuseIdentifier: "transactionHistoryCell")
            transactionCollectionView.register(UINib(nibName: "TransactionHistoryReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "transactionHistoryReusableView")

            
        }
    }
    
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
    
    var transactionFilteredData: [String: [TransactionDataModel]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if homePresenter == nil {
            let homeFormModelValidator = HomeModelValidator()
            let balanceWebservice = HomeService(balanceUrlString: Const.BALANCE, transactionUrlString: Const.TRANSACTION)
            
            homePresenter = HomePresenter(homeModelValidator: homeFormModelValidator, webservice: balanceWebservice, delegate: self)
        }
        
        getBalanceData()
        getTransactionData()
    }
    
    override func viewDidLayoutSubviews() {
        self.transactionCollectionView.layoutIfNeeded()
        self.transactionCollectionView.reloadData()
        self.transactionCollectionViewHeightConstraint.constant = self.transactionCollectionView.contentSize.height
        self.activityContainerView.roundCorners([.topRight, .bottomRight], radius: 18)
    }
    
    func getBalanceData() {
        let balanceFormModel = BalanceFormModel(accessToken: self.accessToken)
        homePresenter?.processGetBalance(formModel: balanceFormModel)
    }
    
    func getTransactionData() {
        let transactionRequest = TransactionRequestModel(accessToken: self.accessToken)
        homePresenter?.processGetTransaction(request: transactionRequest)
    }
}


//MARK: action button
extension HomeController {
    @objc func logoutButtonAction(_ sender: LogoutButton) {
        Credential.shared.logoutCredentials()
        
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController") as! LoginController
        self.view.window?.rootViewController = UINavigationController(rootViewController: loginController)

        self.view.window?.makeKeyAndVisible()
    }
}


extension HomeController: HomeViewProtocol {
    func successfullGetTransaction(response: TransactionResponseModel) {
        //MARK: getting data transaction
        DispatchQueue.main.async {
            
            let groupByDate = Dictionary(grouping: response.data ?? []) { (data) -> String in
                let format = data.transactionDate?.toDateString(withFormat: data.transactionDate ?? "")
                
                return format ?? ""
            }
            self.transactionFilteredData = groupByDate
            self.transactionCollectionView.reloadData()
            self.viewDidLayoutSubviews()
        }
    }
    
    func successfullGetBalance(response: BalanceResponseModel) {
        //MARK: getting data balance
        DispatchQueue.main.async {
            self.balanceLabel.text = "SGD \(response.balance)"
            self.accountLabel.text = self.accountNo
            self.accountHolderNameLabel.text = self.username
        }
    }
    
    func errorHandler(error: HomeError) {
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


//MARK: collection view delegate
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return transactionFilteredData.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactionFilteredData[Array(transactionFilteredData.keys)[section]]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "transactionHistoryReusableView", for: indexPath) as! TransactionHistoryReusableView
        
        header.dateLabel.text = "  \(Array(transactionFilteredData.keys)[indexPath.section])"
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 50)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "transactionHistoryCell", for: indexPath) as! TransactionHistoryCell
        let data = transactionFilteredData[Array(transactionFilteredData.keys)[indexPath.section]]
        cell.transactionData = data?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 32, height: 75)
    }
    
}
