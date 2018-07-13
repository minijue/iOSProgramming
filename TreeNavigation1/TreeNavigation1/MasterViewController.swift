//
//  MasterViewController.swift
//  TreeNavigation1
//
//  Created by 王珏 on 2018/7/13.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var dictData: NSDictionary!
    var listData: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        self.dictData = NSDictionary(contentsOfFile: plistPath!)
        self.listData = self.dictData.allKeys as NSArray
        self.title = "省份信息"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCities" {
            if let indexPath = tableView.indexPathForSelectedRow as IndexPath? {
                let controller = segue.destination as! CitiesViewController
                let selectedIndex = indexPath.row
                
                let selectedName = self.listData[selectedIndex] as! String
                controller.listData = self.dictData[selectedName] as! NSArray
                controller.title = selectedName
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = self.listData[row] as? String
       
        return cell
    }
}

