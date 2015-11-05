//
//  BNRItem.h
//  HomePwnr
//
//  Created by 王珏 on 15/11/5.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
- (void)setThumbnailFromImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END

#import "BNRItem+CoreDataProperties.h"
