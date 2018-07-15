//
//  ViewController.swift
//  TapGestureRecognizer
//
//  Created by 王珏 on 2018/7/15.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var bTrashEmpty = false
    var imageTrashFull: UIImage!
    var imageTrashEmpty: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageTrashFull = UIImage(named: "Image1")
        self.imageTrashEmpty = UIImage(named: "Image2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func foundTap(_ sender: Any) {
        if bTrashEmpty {
            self.imageView.image = self.imageTrashFull
        } else {
            self.imageView.image = self.imageTrashEmpty
        }
        
        bTrashEmpty = !bTrashEmpty
    }
}

