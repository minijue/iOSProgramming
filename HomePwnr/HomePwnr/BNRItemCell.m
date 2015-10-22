//
//  BNRItemCell.m
//  HomePwnr
//
//  Created by 王珏 on 15/10/21.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Action
- (IBAction)showImage:(id)sender {
    if (self.actionBlock)
        self.actionBlock();
}

@end
