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
        self.layer.cornerRadius = 6.0 // 圆角
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

extension InsetLabel {
    convenience init(Text: String?) {
        self.init()
        self.text = Text
        self.textAlignment = .center
//        self.layer.cornerRadius = 5
//        self.layer.masksToBounds = true
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 1
        self.numberOfLines = 0
        self.textColor = .red
        self.textInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}

class InsetLabel: UILabel {
    // 1.定义一个接受间距的属性
    var textInsets = UIEdgeInsets.zero

    //2. 返回 label 重新计算过 text 的 rectangle
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        guard text != nil else {
            return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        }

        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    //3. 绘制文本时，对当前 rectangle 添加间距
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
