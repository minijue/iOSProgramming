//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by 王珏 on 2019/5/30.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
