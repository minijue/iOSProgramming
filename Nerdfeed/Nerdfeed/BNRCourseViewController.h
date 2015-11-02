//
//  BNRCourseTableViewController.h
//  Nerdfeed
//
//  Created by 王珏 on 15/10/30.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRWebViewController.h"

@interface BNRCourseViewController : UITableViewController

@property (nonatomic) BNRWebViewController *webViewController;
@property (nonatomic) UINavigationController *detailController;

@end
