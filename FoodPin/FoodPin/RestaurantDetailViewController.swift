//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2019/5/27.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.image)
        labelName.text = restaurant.name
        labelType.text = restaurant.type
        labelLocation.text = restaurant.location
        
        navigationItem.largeTitleDisplayMode = .never   // 详情视图关闭大导航栏
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
