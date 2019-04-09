//
//  CustomCell.swift
//  SimpleTable
//
//  Created by 王珏 on 2019/4/9.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
