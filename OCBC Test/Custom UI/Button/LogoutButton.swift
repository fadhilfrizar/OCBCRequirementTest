//
//  LogoutButton.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
import UIKit

@IBDesignable
final class LogoutButton: UIButton {

    var borderWidth: CGFloat = 0
    var borderColor = UIColor.clear.cgColor
    var textColor = UIColor.black

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(textColor,for: .normal)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
}

