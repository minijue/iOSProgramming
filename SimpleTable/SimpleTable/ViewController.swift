//
//  ViewController.swift
//  SimpleTable
//
//  Created by 王珏 on 2018/7/1.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
    var listTeams: NSArray!
    var listFilterTeams: NSMutableArray!

    @IBOutlet weak var searchBar: UISearchBar!
    
    func filterContentForSearchText(_ searchText: NSString, scope: Int) {
        if searchText.length == 0 {
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
        } else {
            var tempArray: NSArray!
            var scopeStr: String!
            
            if scope == 0 {
                scopeStr = "SELF.ename contains[c] %@"
            } else if scope == 1 {
                scopeStr = "SELF.name contains[c] %@"
            }
            
            let scopePredicate = NSPredicate(format: scopeStr, searchText)
            tempArray = self.listFilterTeams.filtered(using: scopePredicate) as NSArray
            self.listFilterTeams = NSMutableArray(array: tempArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchBar.showsScopeBar = false
        self.searchBar.sizeToFit()
        
        let plistPath:String! = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath)
        
        self.filterContentForSearchText("", scope: -1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index;
    }
    
    // UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.listFilterTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIndentifier"
        
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIndentifier)
        }
        
        let row = indexPath.section
        let rowDict = self.listFilterTeams[row] as? NSDictionary
        cell.textLabel?.text = rowDict!["name"] as? String
        cell.detailTextLabel?.text = rowDict!["ename"] as? String
        
        let imagePath = String(format: "%@.png", rowDict!["image"] as! String)
        cell.imageView?.image = UIImage(named: imagePath)
        
        return cell
    }
    
    // 索引文字
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [AnyObject]()
        
        for item in self.listFilterTeams {
            let title = ((item as! NSDictionary)["name"] as! String).prefix(2)
            listTitles.append(title as AnyObject)
        }
        
        return listTitles as? [String]
    }
    
    // UISearchBarDelegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchBar.showsScopeBar = true
        self.searchBar.sizeToFit()
        
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsScopeBar = false
        self.searchBar.resignFirstResponder()
        self.searchBar.sizeToFit()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filterContentForSearchText("", scope: -1)
        self.searchBar.showsScopeBar = false
        self.searchBar.resignFirstResponder()
        self.searchBar.sizeToFit()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText as NSString, scope: self.searchBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.filterContentForSearchText(self.searchBar.text! as NSString, scope: selectedScope)
        self.tableView.reloadData()
    }
}

