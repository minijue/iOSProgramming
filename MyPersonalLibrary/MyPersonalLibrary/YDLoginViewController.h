//
//  YDLoginViewController.h
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/26.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YDLoginViewControllerDelegate <NSObject>

- (void)loginWithSuccess;
- (void)loginWithError;
- (void)loginCancelled;

@end

@interface YDLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (nonatomic, assign) id<YDLoginViewControllerDelegate> delegate;

- (IBAction)loginUser:(UIButton *)sender;
- (IBAction)cancelLogin:(UIButton *)sender;

@end
