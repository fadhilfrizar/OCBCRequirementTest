//
//  TextFieldContainerView.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation
import UIKit

@IBDesignable
final class TextFieldContainerView: UIView {
    
    var borderWidth: CGFloat = 2.0
    var borderColor = UIColor.black.cgColor

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
