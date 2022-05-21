//
//  PresentViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/19.
//

import Foundation
import UIKit

class PresentViewController: UIViewController {
    var textField1 = UITextField()
    var textField2 = UITextField()
    var button = UIButton()
    var lable = UILabel()
    var text: String?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    init(Text: String?) {
        self.text = Text
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        button = UIButton(title: "跳转至-> Main View")
        textField1 = UITextField(placeholder: "请输入Key")
        textField2 = UITextField(placeholder: "请输入Value")
        lable = InsetLabel(Text: "接收 Main View 信息: \nValue: \(text ?? "nil")")
        button.addTarget(self, action: #selector(touch), for: .touchDown)
        lable.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField2.translatesAutoresizingMaskIntoConstraints = false

        self.view.backgroundColor = .white
        self.view.addSubview(lable)
        self.view.addSubview(textField1)
        self.view.addSubview(textField2)
        self.view.addSubview(button)

        let textField1X = NSLayoutConstraint(item: textField1, attribute: .centerX,
                                             relatedBy: .equal, toItem: self.view,
                                             attribute: .centerX, multiplier: 1, constant: 0)
        let textField2X = NSLayoutConstraint(item: textField2, attribute: .centerX,
                                             relatedBy: .equal, toItem: self.view,
                                             attribute: .centerX, multiplier: 1, constant: 0)
        let lableX = NSLayoutConstraint(item: lable, attribute: .centerX,
                                             relatedBy: .equal, toItem: self.view,
                                             attribute: .centerX, multiplier: 1, constant: 0)
        let textFieldCon = NSLayoutConstraint(item: textField1, attribute: .bottom,
                                              relatedBy: .equal, toItem: textField2,
                                              attribute: .top, multiplier: 1, constant: -20)
        let textFieldWidth = NSLayoutConstraint(item: textField1, attribute: .width,
                                                relatedBy: .equal, toItem: textField2,
                                                attribute: .width, multiplier: 1, constant: 0)
        let lableTop = NSLayoutConstraint(item: lable, attribute: .top,
                                              relatedBy: .equal, toItem: self.view,
                                              attribute: .top, multiplier: 1, constant: 200)
        let textFieldTop = NSLayoutConstraint(item: textField1, attribute: .top,
                                              relatedBy: .equal, toItem: lable,
                                              attribute: .bottom, multiplier: 1, constant: 20)
        let buttonTop = NSLayoutConstraint(item: button, attribute: .top,
                                           relatedBy: .equal, toItem: textField2,
                                           attribute: .bottom, multiplier: 1, constant: 20)
        let bottonX = NSLayoutConstraint(item: button, attribute: .centerX,
                                         relatedBy: .equal, toItem: self.view,
                                         attribute: .centerX, multiplier: 1, constant: 0)

        self.view.addConstraints([textField1X, textField2X, textFieldCon,
                                  textFieldTop, buttonTop, bottonX, textFieldWidth, lableX, textFieldWidth, lableTop])

//        self.isModalInPresentation = true
//        self.modalPresentationStyle = .fullScreen
    }

    @objc func touch(sender: UIButton) {
//        let info = [textField1.text ?? "": textField2.text ?? ""]
//        
//        guard let customDelegate = reverseDelegate else { return }
//        customDelegate.informationTransmission(info: info)

        self.dismiss(animated: true) {
            print("跳转至-> Main View")
        }
    }
}
