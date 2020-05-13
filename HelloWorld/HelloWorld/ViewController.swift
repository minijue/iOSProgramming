//
//  ViewController.swift
//  HelloWorld
//
//  Created by 王珏 on 2020/4/6.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showMessage(sender: UIButton) {
        //let emojiDict = ["👾":"异形怪兽", "👻":"幽灵", "🤓":"书呆子脸", "🤖":"机器人"]
        
        //let selectedButton = sender
        
        //if let wordToLookup = selectedButton.titleLabel?.text {
        let alertController = UIAlertController(title: "Welcome to My first App", message: /*emojiDict[wordToLookup]*/"Hello world!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
       //}
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

