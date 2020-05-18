//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2020/5/13.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var images = ["barrafina","bourkestreetbakery","cafedeadend","cafeloisl","cafelore","caskpubkitchen","confessional","donostia","fiveleaves","forkeerestaurant","grahamavenuemeats","haighschocolate","homei","palominoespresso","petiteoyster","posatelier","restaurant","royaloak","teakha","traif","upstate","wafflewolf"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: images[indexPath.row])
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        
        let check:UIImage! = UIImage(named: "heart-tick")
        let button = UIButton(type:.custom)
        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: check.size)
        button.frame = frame
        button.setBackgroundImage(check, for: .normal)
        
        cell.accessoryView = button
        cell.accessoryView?.isHidden = !restaurantIsVisited[indexPath.row]
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action:UIAlertAction!) -> Void in
            tableView.deselectRow(at: indexPath, animated: false)
        })
        optionMenu.addAction(cancelAction)

        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavaliable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: false)
        }

        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)

        let menutitle: String = self.restaurantIsVisited[indexPath.row] ? "Undo Check" : "Check in"
        let checkInAction = UIAlertAction(title: menutitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
            cell?.accessoryView?.isHidden = !self.restaurantIsVisited[indexPath.row]
            
            tableView.deselectRow(at: indexPath, animated: false)
        })
        optionMenu.addAction(checkInAction)

        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }

        present(optionMenu, animated: true, completion: nil)
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantLocations.remove(at: indexPath.row)
//            self.restaurantTypes.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//        }
//
////        tableView.reloadData()
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let tickAction = UIContextualAction(style: .normal, title: "Tick", handler: {
            (action, sourceView, completionHandler) in
            self.restaurantIsVisited[indexPath.row] = true
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType =  .checkmark
            cell?.accessoryView?.isHidden = false
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            completionHandler(true)
        })
        
        tickAction.backgroundColor = UIColor.systemGreen
        tickAction.image = UIImage(named: "tick")
        
        let undoAction = UIContextualAction(style: .normal, title: "Undo", handler: {
            (action, sourceView, completionHandler) in
            self.restaurantIsVisited[indexPath.row] = false
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType =  .none
            cell?.accessoryView?.isHidden = true
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            completionHandler(true)
        })
        undoAction.backgroundColor = UIColor.systemGreen
        undoAction.image = UIImage(named: "undo")
        
        let swipeConfiguration = self.restaurantIsVisited[indexPath.row] ? UISwipeActionsConfiguration(actions: [undoAction]) : UISwipeActionsConfiguration(actions: [tickAction]) 
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // “删除”按钮
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {
            (action, sourceView, completionHandler) in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.images.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        })
        
        deleteAction.backgroundColor = UIColor(displayP3Red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        // “分享”按钮
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {
            (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            // 显示“分享”对话框
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.images[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            self.present(activityController, animated: true, completion: nil)
            
            completionHandler(true)
        })
        
        shareAction.backgroundColor = UIColor(displayP3Red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }
}
