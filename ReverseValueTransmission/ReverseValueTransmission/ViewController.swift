//
//  ViewController.swift
//  ReverseValueTransmission
//
//  Created by HaoKun Zhang on 2022/5/17.
//

import UIKit

class ViewController: UIViewController, ReverseProtocol, UIAdaptivePresentationControllerDelegate {
    @IBOutlet weak var lable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(callback),
                                               name: NSNotification.Name(rawValue: "ReverseValueTransmission"),
                                               object: nil)

        let button1 = UIButton(title: "跳转至-> Notification View")
        button1.addTarget(self, action: #selector(touch1), for: .touchDown)

        let button2 = UIButton(title: "跳转至-> Protocol View")
        button2.addTarget(self, action: #selector(touch2), for: .touchDown)

        let button3 = UIButton(title: "跳转至-> Closure View")
        button3.addTarget(self, action: #selector(touch3), for: .touchDown)

        lable.isHidden = true
//        lable.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)

        let button1Top = NSLayoutConstraint(item: button1, attribute: .top,
                                            relatedBy: .equal, toItem: lable,
                                            attribute: .bottom, multiplier: 1, constant: 20)
        let button1CenterX = NSLayoutConstraint(item: button1, attribute: .centerX,
                                                relatedBy: .equal, toItem: self.view,
                                                attribute: .centerX, multiplier: 1, constant: 0)

        let button2Top = NSLayoutConstraint(item: button2, attribute: .top,
                                            relatedBy: .equal, toItem: button1,
                                            attribute: .bottom, multiplier: 1, constant: 20)
        let button2CenterX = NSLayoutConstraint(item: button2, attribute: .centerX,
                                                relatedBy: .equal, toItem: self.view,
                                                attribute: .centerX, multiplier: 1, constant: 0)
        let button2Width = NSLayoutConstraint(item: button2, attribute: .width,
                                              relatedBy: .equal, toItem: button1,
                                              attribute: .width, multiplier: 1, constant: 0)

        let button3Top = NSLayoutConstraint(item: button3, attribute: .top,
                                            relatedBy: .equal, toItem: button2,
                                            attribute: .bottom, multiplier: 1, constant: 20)
        let button3CenterX = NSLayoutConstraint(item: button3, attribute: .centerX,
                                                relatedBy: .equal, toItem: self.view,
                                                attribute: .centerX, multiplier: 1, constant: 0)
        let button3Width = NSLayoutConstraint(item: button3, attribute: .width,
                                              relatedBy: .equal, toItem: button1,
                                              attribute: .width, multiplier: 1, constant: 0)

        self.view.addConstraints([button1Top, button1CenterX, button2Top,
                                  button2CenterX, button3Top, button3CenterX, button2Width, button3Width])
    }

    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        if let protocolViewController = presentationController.presentedViewController as? ProtocolViewController {
            let info = [protocolViewController.textField1.text ?? "": protocolViewController.textField2.text ?? ""]

            guard let customDelegate = protocolViewController.reverseDelegate else { return }
            customDelegate.informationTransmission(info: info)

        } else if let notificationVC = presentationController.presentedViewController as? NotificationViewController {
            let info = [notificationVC.textField1.text: notificationVC.textField2.text]

            // 通过userInfo字典传值 / 也可通过object进行
            let notification = NSNotification.Name(rawValue: "ReverseValueTransmission")
            NotificationCenter.default.post(name: notification, object: nil, userInfo: info as [AnyHashable: Any])
        } else if let closureViewController = presentationController.presentedViewController as? ClosureViewController {
            let info = [closureViewController.textField1.text ?? "": closureViewController.textField2.text ?? ""]

            guard let closure = closureViewController.closure else {
                return
            }
            closure(info)
        }
        print("跳转至-> Main View")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func touch1(sender: UIButton) {
        let notificationViewController = NotificationViewController()
        notificationViewController.presentationController?.delegate = self

        self.present(notificationViewController, animated: true) {
            print("跳转至-> Notification View")
        }
    }

    @objc func touch2(sender: UIButton) {
        let protocolViewController = ProtocolViewController()
        protocolViewController.presentationController?.delegate = self
        protocolViewController.reverseDelegate = self

        self.present(protocolViewController, animated: true) {
            print("跳转至-> Protocol View")
        }
    }

    @objc func touch3(sender: UIButton) {
        let closureViewController = ClosureViewController()
        closureViewController.presentationController?.delegate = self

        closureViewController.closure = { info in
            self.lable.text = "接收 Closure View 信息\nKey:\(info.keys.first ?? "")\nValue: \(info.values.first ?? "")"
            self.lable.textColor = .red
            self.lable.isHidden = false
        }

        self.present(closureViewController, animated: true) {
            print("跳转至-> Closure View")
        }
    }

    @objc func callback(notifunction: NSNotification) {
        lable.text = "接收 Notification View 信息\nKey:\(notifunction.userInfo?.keys.first as? String ?? "")" +
        "\nValue: \(notifunction.userInfo?.values.first as? String ?? "")"
        lable.textColor = .red
        lable.isHidden = false
    }

    func informationTransmission(info: [String: String]) {
        lable.text = "接收 Protocol View 信息\nKey:\(info.keys.first ?? "")\nValue: \(info.values.first ?? "")"
        lable.textColor = .red
        lable.isHidden = false
    }
}
