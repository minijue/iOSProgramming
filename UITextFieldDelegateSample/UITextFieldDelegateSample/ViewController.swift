//
//  ViewController.swift
//  UITextFieldDelegateSample
//
//  Created by 王珏 on 2017/3/18.
//  Copyright © 2017年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // self.textField.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func keyboardDidShow(notification: NSNotification) {
        NSLog("键盘打开")
    }
    
    func keyboardDidHide(notification: NSNotification) {
        NSLog("键盘关闭")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 与书本p69上不同
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDidHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil);
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 与书本p69上不同
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil);
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil);
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NSLog("call textFieldShouldBeginEditing:")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("call textFieldDidBeginEditing:")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        NSLog("call textFieldShouldEndEditing:")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("call textFieldDidEndEditing:")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("call textFieldShouldReturn:")
        textField.resignFirstResponder()
        return true
    }
}

