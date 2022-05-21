//
//  ProtocolViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/18.
//

import Foundation
import UIKit

// 反向传值 所需协议
protocol ReverseProtocol {
    func informationTransmission(info: [String: String])
}

class ProtocolViewController: PresentViewController {
    // 反向传值 代理/协议
    var reverseDelegate: ReverseProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touch(sender: UIButton) {
        let info = [textField1.text ?? "": textField2.text ?? ""]
        guard let customDelegate = reverseDelegate else { return }
        // 代理/协议 方法调用
        customDelegate.informationTransmission(info: info)
        super.touch(sender: sender)
    }
}
