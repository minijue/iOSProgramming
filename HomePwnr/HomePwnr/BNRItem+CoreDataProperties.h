//
//  BNRItem+CoreDataProperties.h
//  HomePwnr
//
//  Created by 王珏 on 15/11/5.
//  Copyright © 2015年 王珏. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "BNRItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *itemName;
@property (nullable, nonatomic, retain) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nullable, nonatomic, retain) NSDate *dateCreated;
@property (nullable, nonatomic, retain) NSString *itemKey;
@property (nullable, nonatomic, retain) UIImage *thumbnail;
@property (nonatomic) double orderingValue;
@property (nullable, nonatomic, retain) NSManagedObject *assetType;

@end

NS_ASSUME_NONNULL_END