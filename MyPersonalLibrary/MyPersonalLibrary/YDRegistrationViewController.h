//
//  YDRegistrationViewController.h
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/23.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YDRegistrationViewControllerDelegate <NSObject>

- (void)registeredWithSuccess;
- (void)registeredWithError;
- (void)cancelRegistration;
@end

@interface YDRegistrationViewController : UIViewController

@property (nonatomic, assign) id<YDRegistrationViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


- (IBAction)registerUser:(UIButton *)sender;
- (IBAction)cancelRegistration:(UIButton *)sender;

@end
