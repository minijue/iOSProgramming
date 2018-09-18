//
//  ViewController.swift
//  DatePickerSample
//
//  Created by 王珏 on 2018/9/18.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    var pickerData : NSDictionary!
    var pickerProvincesData : NSArray!
    var pickerCitiesData : NSArray!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        
        let dict = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dict
        
        self.pickerProvincesData = self.pickerData.allKeys as NSArray
        
        let selectedProvince = self.pickerProvincesData[0] as! String
        self.pickerCitiesData = (self.pickerData[selectedProvince] as! NSArray)
    }

    @IBAction func onclick(_ sender: Any) {
        let theDate : Date = self.datePicker!.date
        let desc = theDate.description(with: NSLocale.current)
        NSLog("The date picked is: %@", desc)
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        NSLog("The date formate is: %@", dateFormatter.string(from: theDate))
        
        self.label.text = dateFormatter.string(from: theDate)
    }
    
    @IBAction func onclick1(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        let selected1 = self.pickerProvincesData[row1] as! String
        let selected2 = self.pickerCitiesData[row2] as! String
        
        let title = String(format: "%@, %@市", selected1, selected2)
        
        self.label1.text = title
    }
    
    // UIPickerViewDateSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.pickerData.allKeys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.pickerProvincesData.count
        } else {
            return self.pickerCitiesData.count
        }
    }
    
    // UIPikcerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return self.pickerProvincesData[row] as? String
        } else {
            return self.pickerCitiesData[row] as? String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let selectedProvince = self.pickerProvincesData[row] as! String
            self.pickerCitiesData = self.pickerData[selectedProvince] as? NSArray
            self.pickerView.reloadComponent(1)
        }
    }
}

