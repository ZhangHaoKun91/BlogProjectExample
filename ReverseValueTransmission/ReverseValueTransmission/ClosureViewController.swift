//
//  ClosureViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/19.
//

import Foundation
import UIKit

class ClosureViewController: PresentViewController {
    // 闭包声明
    var closure: (([String: String]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touch(sender: UIButton) {
        let info = [textField1.text ?? "": textField2.text ?? ""]

        guard let closure = closure else {
            return
        }
        // 闭包反向传值: 调用闭包
        closure(info)
        super.touch(sender: sender)
    }
}
