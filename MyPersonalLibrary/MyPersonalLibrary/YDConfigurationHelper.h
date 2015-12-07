//
//  YDConfigurationHelper.h
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/23.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDConfigurationHelper : NSObject

+ (void)setApplicationStartupDefaults;

+ (BOOL)getBoolValueForConfigurationKey:(NSString *)_objectKey;

+ (void)setBoolValueForConfigurationKey:(NSString *)_objectKey withValue:(BOOL)_boolvalue;

+ (NSString *)getStringValueForConfiguratrionKey:(NSString *)_objectKey;

+ (void)setStringValueForConfiguratrionKey:(NSString *)_objectKey withValue:(NSString *)_value;

@end
