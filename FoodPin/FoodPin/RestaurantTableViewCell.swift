//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by 王珏 on 2019/5/18.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! /* 用代码设置圆形图标 {
    didSet {
        thumbnailImageView.layer.cornerRadius = 30.0    // half of width
        thumbnailImageView.clipsToBounds = true
    }
 } */

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
