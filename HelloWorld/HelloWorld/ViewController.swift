//
//  ViewController.swift
//  HelloWorld
//
//  Created by 王珏 on 2019/5/7.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var emojiDict = ["😱":"恐惧尖叫的表情", "👾":"异形怪兽", "😤":"鼻孔喷气的生气表情", "💩":"一堆大便", "👻":"幽灵", "🤓":"书呆子脸", "🤖":"机器人"]
    
    @IBAction func showMessage(sender: UIButton) {
        let selectedButton = sender
        
        if let wordToLookup = selectedButton.titleLabel?.text {
        
            let alertController = UIAlertController(title: "Welcome to My First App", message: emojiDict[wordToLookup], preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


