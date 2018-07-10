//
//  ViewController.swift
//  ModalViewSample
//
//  Created by 王珏 on 2018/7/10.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUserID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector:#selector(registerCompletion), name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func registerCompletion(notification: NSNotification) {
        let theData: NSDictionary = notification.userInfo! as NSDictionary
        let username = theData.object(forKey: "username") as! NSString
        txtUserID.text = username as String
    }
}

