//
//  ViewController.swift
//  CustomCell
//
//  Created by 王珏 on 2018/7/2.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dictData: NSDictionary!
    var listGroupName: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let tempList = self.dictData.allKeys as NSArray
        self.listGroupName = tempList.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupName = self.listGroupName[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        return listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        var cell:CustomCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier) as! CustomCell
        }
        
        let section = indexPath.section
        let row = indexPath.row
        
        let groupName = self.listGroupName[section] as! String
        let listTeams = self.dictData[groupName] as! NSArray
        let rowDict = listTeams[row] as! NSDictionary
        
        cell.myLabel.text = rowDict["name"] as? String
        cell.myLabel1.text = rowDict["ename"] as? String
        
        let imageFile = rowDict["image"] as! String
        cell.myImageView.image = UIImage(named: String(format: "%@.png", imageFile))
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.listGroupName.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupName = self.listGroupName[section] as! String
        return groupName
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [AnyObject]()
        
        for item in self.listGroupName {
            let title = (item as! String).prefix(1)
            listTitles.append(title as AnyObject)
        }
        
        return listTitles as? [String]
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

