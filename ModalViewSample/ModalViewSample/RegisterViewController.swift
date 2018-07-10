//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by 王珏 on 2018/7/10.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBAction func save(_ sender: Any) {
        let dataDict = ["username": self.txtUsername.text]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict as Any as? [AnyHashable : Any])
        self.dismiss(animated: true, completion: {NSLog("Clicked Done button")})
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: {NSLog("Clicked Cancel button")})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtUsername.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let dataDict = ["username": self.txtUsername.text]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: dataDict as Any as? [AnyHashable : Any])
        txtUsername.resignFirstResponder()
        self.dismiss(animated: true, completion: {NSLog("Clicked Done button")})
        return true
    }
}
