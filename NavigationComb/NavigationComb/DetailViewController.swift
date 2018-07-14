//
//  DetailViewController.swift
//  NavigationComb
//
//  Created by 王珏 on 2018/7/14.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var txtLabel: UILabel!
    var city: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtLabel.text = city
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowModal" {
            let model = (segue.destination as! UINavigationController).childViewControllers[0] as! ModelViewController
            
            model.city = self.city
            model.title = self.title
        }
    }
    

}
