//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by 王珏 on 2019/4/15.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var txtField: UITextField!
    var listTeams: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "单元格插入和删除"
        
        self.txtField.isHidden = true
        self.txtField.delegate = self
        
        self.listTeams = NSMutableArray(array: ["江西"])
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
        if editing {
            self.txtField.isHidden = false
        } else {
            self.txtField.isHidden = true
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listTeams.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        // Configure the cell...
        let b_addCell = (indexPath.row == self.listTeams.count)
        
        if b_addCell {
            self.txtField.frame = CGRect(x: 10, y: 5, width: 300, height: 44)
            self.txtField.borderStyle = .none
            self.txtField.placeholder = "Add..."
            self.txtField.text = ""
            cell.contentView.addSubview(self.txtField)
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .none
            cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        }
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let indexPaths = [indexPath]
        if editingStyle == .delete {
            // Delete the row from the data source
            self.listTeams.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            self.listTeams.insert(self.txtField.text as Any, at: self.listTeams.count)
            self.tableView.insertRows(at: indexPaths, with: .fade)
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == self.listTeams.count {
            return .insert
        } else {
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row != self.listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

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

}
