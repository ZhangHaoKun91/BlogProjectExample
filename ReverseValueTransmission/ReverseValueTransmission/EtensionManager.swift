//
//  EtensionManager.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/19.
//

import Foundation
import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.frame.size = CGSize(width: 200, height: 30)
        self.placeholder = placeholder
        self.borderStyle = .line
        self.returnKeyType = UIReturnKeyType.send
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init()
        self.setTitle(title, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.layer.cornerRadius = 6.0
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.red, for: .highlighted)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.titleEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
