//
//  ViewController.swift
//  AutoLayoutSample
//
//  Created by 王珏 on 2018/7/8.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let iOSDeviceScreenSize: CGSize = UIScreen.main.bounds.size
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
            if iOSDeviceScreenSize.height > iOSDeviceScreenSize.width {
                NSLog("竖屏")
                if iOSDeviceScreenSize.height == 568 {
                    NSLog("iPhone 5/5C/5S/SE")
                } else if iOSDeviceScreenSize.height == 667 {
                    NSLog("iPhone 6/6S/7/8")
                } else if iOSDeviceScreenSize.height == 736 {
                    NSLog("iPhone 6/6S/7/8 Plus")
                } else if iOSDeviceScreenSize.height == 812 {
                    NSLog("iPhone X")
                } else {
                    NSLog("其他 iPhone")
                }
            }
        } else {
            NSLog("横屏")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

