//
//  ViewController.swift
//  IndexTable
//
//  Created by 王珏 on 2019/4/10.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dictData: NSDictionary!
    var listGroupname: NSArray!    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        let plistPath = Bundle.main.path(forResource: "team_dictionary", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let tempList = self.dictData.allKeys as NSArray
        self.listGroupname = tempList.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray
    }
    
    // UITableViewDataSource 方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupName = self.listGroupname[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        return listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        let groupName = self.listGroupname[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        let team = listTeams[row] as! NSDictionary
        cell.textLabel?.text = team["name"] as? String
        
        let imagePath = String(format: "%@.png", team["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.listGroupname.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupName = self.listGroupname[section] as! String
        return groupName
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [AnyObject]()
        
        for item in self.listGroupname {
            let title = (item as! String).prefix(1)
            listTitles.append(title as AnyObject)
        }
        return listTitles as? [String]
    }
}

