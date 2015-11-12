//
//  BNRItem.m
//  HomepwnrPractise23
//
//  Created by 王珏 on 15/11/12.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

// Insert code here to add functionality to your managed object subclass
- (void)setThumbnailFromImage:(UIImage *)image {
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect = newRect;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.thumbnail = smallImage;
    
    UIGraphicsEndImageContext();
}

- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    self.dateCreated = [NSDate date];
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    self.itemKey = key;
}


@end
