//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by 王珏 on 2019/4/19.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var events: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let plistPath = Bundle.main.path(forResource: "events", ofType: "plist")
        self.events = NSArray(contentsOfFile: plistPath!)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.events.count / 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        let event = self.events[indexPath.section*2 + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        let imageFile = event["image"] as! String
        cell.imageView.image = UIImage(named: imageFile)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = self.events[indexPath.section*2+indexPath.row] as! NSDictionary
        NSLog("select event name: %@", event["name"] as! String)
    }
}

