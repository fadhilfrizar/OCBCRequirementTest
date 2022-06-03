//
//  HomeController.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var activityContainerView: UIView!
    
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var accountHolderNameLabel: UILabel!
    
    @IBOutlet weak var transactionHistoryLabel: UILabel!
    
    @IBOutlet weak var transactionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let accessToken = Credential.shared.gettingAccessToken()
        print("access token", accessToken)
    }
}
