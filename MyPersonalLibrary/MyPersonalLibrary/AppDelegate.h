//
//  AppDelegate.h
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/23.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDRegistrationViewController.h"
#import "YDLoginViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, YDLoginViewControllerDelegate, YDRegistrationViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) YDLoginViewController *loginVC;
@property (strong, nonatomic) YDRegistrationViewController *registrationVC;

@end

