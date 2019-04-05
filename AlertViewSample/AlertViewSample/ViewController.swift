//
//  ViewController.swift
//  AlertViewSample
//
//  Created by 王珏 on 2019/4/5.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func popupAlertView(_ sender: Any) {
        let alertController:UIAlertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: .alert)
        
        // 按钮
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: {(alerts: UIAlertAction)-> Void in NSLog("...")})
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

