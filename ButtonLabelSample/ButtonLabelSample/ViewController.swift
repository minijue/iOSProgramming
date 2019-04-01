//
//  ViewController.swift
//  ButtonLabelSample
//
//  Created by 王珏 on 2019/4/1.
//  Copyright © 2019年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label1: UILabel!
    
    @IBAction func onClick(_ sender: Any) {
        self.Label1.text = "Hello world"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

