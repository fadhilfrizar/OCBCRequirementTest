//
//  TransactionHistoryCell.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import UIKit

class TransactionHistoryCell: UICollectionViewCell {

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var accountNoLabel: UILabel!
    @IBOutlet weak var accountHolderLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var transactionData: TransactionDataModel! {
        didSet {
            self.balanceLabel.text = "\(transactionData.amount ?? 0.0)"
            self.accountNoLabel.text = transactionData.receipient?.accountNo ?? ""
            self.accountHolderLabel.text = transactionData.receipient?.accountHolder ?? ""
            self.timeLabel.text = transactionData.transactionDate ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCornerRadius()
    }

    
    func setupCornerRadius() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
    }
}
