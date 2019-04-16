//
//  ViewController.swift
//  StaticTableGroup
//
//  Created by 王珏 on 2019/4/16.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if self.txtPwd.text == "123" && self.txtUserName.text == "wangjue" {
            NSLog("登录成功")
            self.txtUserName.resignFirstResponder()
            self.txtPwd.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

