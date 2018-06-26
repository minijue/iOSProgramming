//
//  ViewController.swift
//  AlertViewSample
//
//  Created by 王珏 on 2018/6/26.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func popupAlertView(_ sender: Any) {
        let alertController:UIAlertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: .alert)
        let cancelAction = UIAlertAction( title: "Cancel",
                                          style: .cancel,
                                          handler: {(alerts:UIAlertAction)->Void in
                                            NSLog("Cancel pressed")
        })
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction( title: "OK",
                                      style: .default,
                                      handler: { (alerts:UIAlertAction) -> Void in
                                        NSLog("OK pressed")
        })
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func popupActionSheet(_ sender: Any) {
        let sheetController:UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let destructiveAction:UIAlertAction = UIAlertAction(title: "破坏性按钮", style: .destructive, handler: {(alerts:UIAlertAction!)->Void in
            NSLog("破坏性按钮")
        })
        sheetController.addAction(destructiveAction)
        let fbAction:UIAlertAction = UIAlertAction(title: "Facebook", style: .default, handler: {(alerts:UIAlertAction!)->Void in
            NSLog("Fackbook")
        })
        sheetController.addAction(fbAction)
        let wbAction:UIAlertAction = UIAlertAction(title: "新浪微博", style: .default, handler: {(alerts:UIAlertAction!)->Void in
            NSLog("新浪微博")
        })
        sheetController.addAction(wbAction)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "取消", style: .cancel, handler: {(alerts:UIAlertAction!)->Void in
            NSLog("取消")
        })
        sheetController.addAction(cancelAction)
        
        self.present(sheetController, animated: true, completion: nil)
    }
}

