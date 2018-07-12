//
//  DataViewController.swift
//  PageNavigationSample
//
//  Created by 王珏 on 2018/7/12.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFile: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: imageFile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


}

