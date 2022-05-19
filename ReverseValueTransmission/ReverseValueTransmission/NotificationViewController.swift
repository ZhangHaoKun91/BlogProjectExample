//
//  NotificationViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/17.
//

import Foundation
import UIKit

class NotificationViewController: PresentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touch(sender: UIButton) {
        let info = [textField1.text: textField2.text]

        // 通过userInfo字典传值 / 也可通过object进行
        let notification = NSNotification.Name(rawValue: "ReverseValueTransmission")
        NotificationCenter.default.post(name: notification, object: nil, userInfo: info as [AnyHashable: Any])
        super.touch(sender: sender)
    }
}
