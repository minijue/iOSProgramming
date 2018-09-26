//
//  MyPickerViewController.swift
//  PopControl
//
//  Created by 王珏 on 2018/9/19.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

public class MyPickerViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData : NSArray!
    public var delegate : MyPickerViewControllerDelegate?
    
    @IBOutlet weak var picker: UIPickerView!
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public init() {
        let resourcesBundle = Bundle(for: MyPickerViewController.self)
        super.init(nibName: "MyPickerViewController", bundle: resourcesBundle)
        
        self.pickerData = ["价格不限", "$0 - $1000/day", "$1000 - $2000/day", "$2000 - $3000/day", "$3000 - $5000/day"]
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.picker.dataSource = self
        self.picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func done(_ sender: Any) {
        self.hideInView()
        
        let selectedIndex = self.picker.selectedRow(inComponent: 0)
        self.delegate?.myPickerViewClose(selected: self.pickerData[selectedIndex] as! String)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.hideInView()
    }
    
    public func showInView(superview : UIView) {
        if self.view.superview == nil {
            superview.addSubview(self.view)
        }
        
        self.view.center = CGPoint(x: self.view.center.x, y: 2800)
        self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: superview.frame.size.width, height: superview.frame.size.height)
        
        UIView.animate(withDuration: 0.3, animations: {()->Void in
            self.view.center = CGPoint(x: superview.center.x, y: superview.frame.size.height - self.view.frame.size.height/2)
        }, completion: nil)
       
    }
    
    public func hideInView() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.view.center = CGPoint(x: self.view.center.x, y: 2800)
        }, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row] as? String
    }

}

public protocol MyPickerViewControllerDelegate {
    func myPickerViewClose(selected: String)
}
