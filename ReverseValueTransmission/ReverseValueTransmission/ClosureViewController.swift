//
//  ClosureViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/19.
//

import Foundation
import UIKit

class ClosureViewController: PresentViewController {
    var closure: (([String: String]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touch(sender: UIButton) {
        let info = [textField1.text ?? "": textField2.text ?? ""]

        guard let closure = closure else {
            return
        }
        closure(info)
        super.touch(sender: sender)
    }
}
