//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by 王珏 on 2018/7/2.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet var txtField: UITextField!
    var listTeams: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "单元格的插入和删除"
        
        self.txtField.isHidden = true
        
        self.listTeams = NSMutableArray(array: ["江西","上海","北京"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.tableView.setEditing(editing, animated: true)
        self.txtField.isHidden = !editing
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        let b_addCell = (indexPath.row == self.listTeams.count)
        
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if b_addCell == false {
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        } else {
            self.txtField.frame = CGRect(x: 20, y: 2, width: 300, height: 44)
            self.txtField.borderStyle = UITextBorderStyle.none
            self.txtField.placeholder = "增加..."
            self.txtField.text = ""
            cell.contentView.addSubview(self.txtField)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == self.listTeams.count {
            return UITableViewCellEditingStyle.insert
        } else {
            return UITableViewCellEditingStyle.delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let indexPaths = [indexPath]
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.listTeams.removeObject(at: indexPath.row)
            self.tableView.deleteRows(at: indexPaths, with: UITableViewRowAnimation.fade)
        } else if editingStyle == UITableViewCellEditingStyle.insert {
            let txt: String! = self.txtField.text
            if (txt.count > 0) {
            self.listTeams.insert(self.txtField.text!, at: self.listTeams.count)
            self.tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.fade)
            }
        }
        
        self.tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txtField.resignFirstResponder()
        return true;
    }
    
}

