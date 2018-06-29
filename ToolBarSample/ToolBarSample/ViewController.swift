//
//  ViewController.swift
//  ToolBarSample
//
//  Created by 王珏 on 2018/6/29.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func save(_ sender: Any) {
        self.label.text = "Clicked Save"
    }
    
    @IBAction func open(_ sender: Any) {
        self.label.text = "Clicked Open"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done(_ sender: Any) {
        self.label.text = "Clicked Done"
    }
    
    
    @IBAction func add(_ sender: Any) {
        self.label.text = "Clicked Add"
    }
}

