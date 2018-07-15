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
    var bTrashNil = false
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
    
    @IBAction func longPress(_ sender: Any) {
        let paramSender = sender as! UILongPressGestureRecognizer
        
        if paramSender.state == .began {
            if bTrashNil {
                self.imageView.image = self.imageTrashFull
            } else {
                self.imageView.image = nil
            }
            bTrashNil = !bTrashNil
        }        
    }
    
    @IBAction func foundPan(_ sender: Any) {
        let paramSender = sender as! UIPanGestureRecognizer
        
        if paramSender.state != .ended && paramSender.state != .failed {
            let location = paramSender.location(in: paramSender.view!.superview)
            paramSender.view!.center = location
        }
    }
}

