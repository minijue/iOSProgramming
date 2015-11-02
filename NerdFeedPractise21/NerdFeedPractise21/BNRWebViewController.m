//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by 王珏 on 15/11/1.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRWebViewController.h"
@interface BNRWebViewController () <UIWebViewDelegate>
@end

@implementation BNRWebViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    
    self.view = webView;
    webView.delegate = self;
}

- (void)setURL:(NSURL *)URL {
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

- (void)viewDidLoad {
    CGRect rect = [[UIScreen mainScreen] bounds];
    rect.origin.y = rect.size.height - self.navigationController.navigationBar.bounds.size.height - 40;
    rect.size.height = 40;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:rect];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(webAction:)];
    back.enabled = NO;
    UIBarButtonItem *forward = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self action:@selector(webAction:)];
    forward.enabled = NO;
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttons = [[NSArray alloc] initWithObjects:back, space, forward, nil];
    toolbar.items = buttons;
    
    [self.view addSubview:toolbar];
}

- (void)webAction:(UIBarButtonItem *)item {
    UIWebView *webView = (UIWebView *)self.view;
    if ([item.title isEqualToString:@"Back"]) {
        [webView goBack];
    } else if ([item.title isEqualToString:@"Forward"]) {
        [webView goForward];
    }
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    UIToolbar *toolbar = webView.subviews[1];
    toolbar.items[0].enabled = webView.canGoBack;
    toolbar.items[2].enabled = webView.canGoForward;
}

@end
