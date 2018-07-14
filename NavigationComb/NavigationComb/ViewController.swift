//
//  ViewController.swift
//  NavigationComb
//
//  Created by 王珏 on 2018/7/14.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dictData: NSDictionary!
    var listData: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        let listProvices = self.dictData.allKeys as NSArray
        
        let navigationController = self.parent as! UINavigationController
        for i in 1 ... listProvices.count {
            navigationController.tabBarController?.tabBar.items![i-1].title = listProvices[i-1] as? String
        }
        let selectedProvinces = navigationController.tabBarItem.title!
        
        NSLog(selectedProvinces)
        
        self.listData = self.dictData[selectedProvinces] as! NSArray
        self.navigationItem.title = selectedProvinces + "省"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        let st: NSDictionary! = self.listData[row] as! NSDictionary
        cell.textLabel!.text = st["name"] as? String

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowDetail" {
            let detail = segue.destination as! DetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow as IndexPath?
            let index = indexPath?.row
            let dict = self.listData[index!] as! NSDictionary
            
            detail.city = dict["url"] as? String
            detail.title = dict["name"] as? String
        }
    }
}
