//
//  ProtocolViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/18.
//

import Foundation
import UIKit

protocol ReverseProtocol {
    func informationTransmission(info: [String: String])
}

class ProtocolViewController: PresentViewController {
    var reverseDelegate: ReverseProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touch(sender: UIButton) {
        let info = [textField1.text ?? "": textField2.text ?? ""]
        guard let customDelegate = reverseDelegate else { return }
        customDelegate.informationTransmission(info: info)
        super.touch(sender: sender)
    }
}
