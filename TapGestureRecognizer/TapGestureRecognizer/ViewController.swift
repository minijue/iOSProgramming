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
    
    var rotationAngle : CGFloat = 0.0
    var currentScale: CGFloat = 1.0
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.tapCount == 1 {
            self.foundTap()
        } 

    func foundTap() {
        if bTrashEmpty {
            self.imageView.image = self.imageTrashFull
        } else {
            self.imageView.image = self.imageTrashEmpty
        }
        
        bTrashEmpty = !bTrashEmpty
    }
    
    @IBAction func foundRotation(_ sender: Any) {
        let paramSender = sender as! UIRotationGestureRecognizer
        
        self.imageView.transform = CGAffineTransform(rotationAngle: rotationAngle + paramSender.rotation)
        
        if paramSender.state == .ended {
            rotationAngle += paramSender.rotation
        }
    }
    
    @IBAction func foundPinch(_ sender: Any) {
        let paramSender = sender as! UIPinchGestureRecognizer
        
        if paramSender.state == .ended {
            currentScale = paramSender.scale
        } else if paramSender.state == .began && currentScale != 0.0 {
            paramSender.scale = currentScale
        }
        
        self.imageView.transform = CGAffineTransform(scaleX: paramSender.scale, y: paramSender.scale)
    }
    
    @IBAction func foundEdgePan(_ paramSender: UIScreenEdgePanGestureRecognizer) {        
        NSLog("边缘滑动")
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
    
    @IBAction func swipe(_ sender: Any) {
        let paramSender = sender as! UISwipeGestureRecognizer
        
        switch paramSender.direction {
        case .down:
            NSLog("down")
        case .left:
            NSLog("left")
        case .right:
            NSLog("right")
        case .up:
            NSLog("up")
        default:
            NSLog("others")
        }
       
    }
    
}

