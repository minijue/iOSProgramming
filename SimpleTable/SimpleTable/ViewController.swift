//
//  ViewController.swift
//  SimpleTable
//
//  Created by 王珏 on 2019/4/9.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
    
    var listTeams: NSArray!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var listFilterTeams: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
        self.searchBar.delegate = self
        
        self.searchBar.showsScopeBar = false
        self.searchBar.sizeToFit()       
        
        self.filterContentForSearchText(searchText: "", scope: -1)
    }
    
    func filterContentForSearchText(searchText: String, scope: Int) {
        self.listFilterTeams = NSMutableArray(array: self.listTeams)
        if (searchText.count) > 0 && (scope > -1) {
            let tempArray: NSArray!
            var strf = "SELF.image contains[c] %@"
            if scope == 1 {
                strf = "SELF.name contains[c] %@"
            }
            let scopePredicate = NSPredicate(format: strf, searchText)
            tempArray = self.listTeams.filtered(using: scopePredicate) as NSArray
            self.listFilterTeams = NSMutableArray(array: tempArray)
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listFilterTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell! = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? CustomCell
        
        let row = indexPath.row
        let rowDict = self.listFilterTeams[row] as! NSDictionary
        
        // cell.textLabel?.text = rowDict["name"] as? String
        cell.myLabel.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String)
        // cell.imageView?.image = UIImage(named: imagePath)
        cell.myImageView.image = UIImage(named: imagePath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // UISearchBarDelegate Methods
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
        self.filterContentForSearchText(searchText: "", scope: -1)
        self.searchBar.showsScopeBar = false
        self.searchBar.resignFirstResponder()
        self.searchBar.sizeToFit()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText: searchText, scope: self.searchBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.filterContentForSearchText(searchText: self.searchBar.text!, scope: selectedScope)
        self.tableView.reloadData()
    }
}
