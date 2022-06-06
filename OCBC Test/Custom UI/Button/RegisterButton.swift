//
//  RegisterButton.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
import UIKit

@IBDesignable
final class RegisterButton: UIButton {

    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.black.cgColor
    var textColor = UIColor.white

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        
        self.backgroundColor = UIColor.white
        
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
}

