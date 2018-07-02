//
//  CustomCell.swift
//  CustomCell
//
//  Created by 王珏 on 2018/7/2.
//  Copyright © 2018年 wangjue. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
