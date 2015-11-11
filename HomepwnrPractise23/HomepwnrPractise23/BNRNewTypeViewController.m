//
//  BNRNewTypeViewController.m
//  HomepwnrPractise23
//
//  Created by 王珏 on 15/11/11.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRNewTypeViewController.h"
#import "BNRItemStore.h"

@interface BNRNewTypeViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *typeText;
@end

@implementation BNRNewTypeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                  target:self
                                                                                  action:@selector(save:)];
        self.navigationItem.rightBarButtonItem = doneItem;
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                    target:self
                                                                                    action:@selector(cancel:)];
        self.navigationItem.leftBarButtonItem = cancelItem;
    }
    return self;
}

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
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self save:nil];
    return YES;
}

- (void)save:(id)sender
{
    NSString *text = [self.typeText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (![text isEqualToString:@""])
        [[BNRItemStore sharedStore] addAssetType:text];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (void)cancel:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

@end
