//
//  ViewController.swift
//  UITextFieldDelegateSample
//
//  Created by 王珏 on 2018/6/23.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name:NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        NSLog("键盘打开")
    }
    
    @objc func keyboardDidHide(notification: NSNotification) {
        NSLog("键盘关闭")
    }
    
    // MARK: -- 实现UITextFieldDelegate方法
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NSLog("call textFieldShouldBeginEditing:")
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        NSLog("call textFieldDidBeginEditing")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        NSLog("call textFieldShouldEndEditing")
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("call textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        NSLog("textFieldShouldReturn")
        textField.resignFirstResponder()    // 关闭键盘
        return true;
    }
}

