//
//  ViewController.swift
//  ButtonLabelSample
//
//  Created by 王珏 on 2018/6/23.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onClick(_ sender: Any) {
        self.Label1.text="Hello World"
    }
}

