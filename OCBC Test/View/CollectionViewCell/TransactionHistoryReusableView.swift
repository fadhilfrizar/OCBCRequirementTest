//
//  TransactionHistoryReusableView.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import UIKit

class TransactionHistoryReusableView: UICollectionReusableView {

    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.backgroundColor = .red
            dateLabel.clipsToBounds = true
            dateLabel.layer.cornerRadius = 12
            dateLabel.textColor = .white
            dateLabel.font = .boldSystemFont(ofSize: 16)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
