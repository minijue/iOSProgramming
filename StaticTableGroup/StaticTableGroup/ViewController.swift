//
//  ViewController.swift
//  StaticTableGroup
//
//  Created by 王珏 on 2018/7/4.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var txtUName: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    @IBAction func login(_ sender: Any) {
        if self.txtUName.text == "wangjue" &&
            self.txtPwd.text == "123" {
            NSLog("登录成功")
            self.txtPwd.resignFirstResponder()
            self.txtUName.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

