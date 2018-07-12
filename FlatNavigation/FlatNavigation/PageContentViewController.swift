//
//  PageContentViewController.swift
//  FlatNavigation
//
//  Created by 王珏 on 2018/7/12.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var pageIndex = 0
    var imagefile: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imagefile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
