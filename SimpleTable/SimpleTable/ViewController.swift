//
//  ViewController.swift
//  SimpleTable
//
//  Created by 王珏 on 2018/7/1.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var listTeams : NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let plistPath:String! = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIndentifier"
        
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIndentifier)
        }
        
        let row = indexPath.row
        let rowDict = self.listTeams[row] as? NSDictionary        
        cell.textLabel?.text = rowDict!["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict!["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        return cell
    }
    
}

