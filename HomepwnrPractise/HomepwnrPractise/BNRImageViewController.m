//
//  BNRImageViewController.m
//  HomePwnr
//
//  Created by 王珏 on 15/10/21.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRImageViewController.h"

@interface BNRImageViewController () <UIGestureRecognizerDelegate>

@property (nonatomic) CGFloat lastScale;
@property (nonatomic) CGRect oldFrame;
@property (nonatomic) CGRect largeFrame;

@end

@implementation BNRImageViewController

- (void)loadView {
    UIImageView *imageView = [[UIImageView alloc] init];
//  imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.contentMode = UIViewContentModeCenter;
    imageView.clipsToBounds  = YES;
    self.view = imageView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self.view addGestureRecognizer:pinch];
    
    UIImageView *imageView = (UIImageView *)self.view;
    [imageView setMultipleTouchEnabled:YES];
    [imageView setUserInteractionEnabled:YES];
    imageView.image = self.image;
    
    self.oldFrame = imageView.frame;
    self.largeFrame = CGRectMake(0, 0, 5 * self.oldFrame.size.width, 5 * self.oldFrame.size.height);
}

- (void)pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    UIView *view = pinchGestureRecognizer.view;
    
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}

@end
