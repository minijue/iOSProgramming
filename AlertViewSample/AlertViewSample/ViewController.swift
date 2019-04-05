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
    
    @IBAction func popupActionSheet(_ sender: Any) {
        let actionController:UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let destructiveAction:UIAlertAction = UIAlertAction(title: "破坏性按钮", style: .destructive, handler: {(alerts:UIAlertAction!)->Void in
            NSLog("破坏性按钮")
        })
        actionController.addAction(destructiveAction)
        
        let list1Action = UIAlertAction(title: "Facebook", style: .default, handler: { (alerts: UIAlertAction)->Void
            in
            NSLog("touched facebook")            
        })
        actionController.addAction(list1Action)
        
        let list2Action = UIAlertAction(title: "Twitter", style: .default, handler: { (alerts: UIAlertAction)->Void in NSLog("touched twitter")})
        actionController.addAction(list2Action)
        
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {(alerts: UIAlertAction)-> Void in NSLog("...")})
        actionController.addAction(cancelAction)
        
        self.present(actionController, animated: true, completion: nil)
    }
}

