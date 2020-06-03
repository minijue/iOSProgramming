//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2020/6/3.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var restaurantLocation: UILabel!
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurantImageName = ""
    var name = ""
    var type = ""
    var location = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: self.restaurantImageName)
        restaurantName.text = name
        restaurantType.text = type
        restaurantLocation.text = location
//        navigationItem.largeTitleDisplayMode = .never
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
