//
//  YDRegistrationViewController.m
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/23.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "YDRegistrationViewController.h"
#import "NSString+MD5.h"
#import "KeychainItemWrapper.h"

@interface YDRegistrationViewController ()

@end

@implementation YDRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerUser:(UIButton *)sender {
    if ([self.nameField.text length] == 0 || [self.passwordField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"用户名或密码不能为空" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"YDAPPNAME" accessGroup:nil];
        [keychain setObject:self.nameField.text forKey:(__bridge id)kSecAttrAccount];
        [keychain setObject:[self.passwordField.text MD5] forKey:(__bridge id)kSecValueData];
        
        [YDConfigurationHelper setBoolValueForConfigurationKey:bYDRegistered withValue:YES];
        
        [self.delegate registeredWithSuccess];
    }
}

- (IBAction)cancelRegistration:(UIButton *)sender {
    [self.delegate cancelRegistration];
}
@end
