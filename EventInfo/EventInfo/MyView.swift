//
//  MyView.swift
//  EventInfo
//
//  Created by 王珏 on 2018/9/17.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class MyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touchesBegan - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch: touch as UITouch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touchesMoved - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch: touch as UITouch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touchesEnded - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch: touch as UITouch)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touchesCanceled - touch count = %i", touches.count)
        for touch in touches {
            self.logTouchInfo(touch: touch as UITouch)
        }
    }
    
    func logTouchInfo(touch : UITouch) {
        let locInSelf = touch.location(in: self)
        let locInWin = touch.location(in: nil)
        
        NSLog("     touch.locationInView = {%.2f, %.2f}", locInSelf.x.native, locInSelf.y.native)
        NSLog("     touch.locationInWin= {%.2f, %.2f}", locInWin.x.native, locInWin.y.native)
        NSLog("     touch.phase = %i", touch.phase.rawValue)
        NSLog("     touch.tapCount = %d", touch.tapCount)
    }
}
