//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by 王珏 on 2020/6/10.
//  Copyright © 2020 王珏. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel! {
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
