//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by 王珏 on 2018/7/4.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var events: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let plistPath = Bundle.main.path(forResource: "events", ofType: "plist")
        self.events = NSArray(contentsOfFile: plistPath!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.events.count / 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        let imageFile = event["image"] as! String
        cell.imageView.image = UIImage(named: imageFile)
        
        return cell
    }
    
    // UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = self.events[indexPath.section * 2 + indexPath.row] as! NSDictionary
        NSLog("select event name: %@", event["name"] as! String)
    }
}

