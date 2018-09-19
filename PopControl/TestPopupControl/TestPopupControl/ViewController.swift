//
//  ViewController.swift
//  TestPopupControl
//
//  Created by 王珏 on 2018/9/19.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit
import PopControl

class ViewController: UIViewController, MyPickerViewControllerDelegate {
    var pickerViewController = MyPickerViewController()
    
    func myPickerViewClose(selected: String) {
        NSLog("selected %@", selected)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerViewController.delegate = self
    }

    @IBAction func test1(_ sender: Any) {
        self.pickerViewController.showInView(superview: self.view)
    }
    
}

