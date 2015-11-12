//
//  BNRItemCell.h
//  HomePwnr
//
//  Created by 王珏 on 15/10/21.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BNRItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (nonatomic, copy) void (^actionBlock)(void);

@end
