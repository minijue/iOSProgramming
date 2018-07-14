//
//  ModelViewController.swift
//  NavigationComb
//
//  Created by 王珏 on 2018/7/14.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {    
    @IBOutlet weak var txtLabel: UILabel!
    var city: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.txtLabel.text = self.city
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        self.dismiss(animated: true) {
            NSLog("Save")
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
