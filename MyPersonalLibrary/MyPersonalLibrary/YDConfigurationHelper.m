//
//  YDConfigurationHelper.m
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/11/23.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import "YDConfigurationHelper.h"

@implementation YDConfigurationHelper

+ (void)setApplicationStartupDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:NO forKey:bYDFirstLaunch];
    [defaults setBool:NO forKey:bYDAuthenticated];
    [defaults synchronize];
}

+ (BOOL)getBoolValueForConfigurationKey:(NSString *)_objectKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    return [defaults boolForKey:_objectKey];
}

+ (void)setBoolValueForConfigurationKey:(NSString *)_objectKey withValue:(BOOL)_boolvalue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:_boolvalue forKey:_objectKey];
    [defaults synchronize];
}

+ (NSString *)getStringValueForConfiguratrionKey:(NSString *)_objectKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    if ([defaults stringForKey:_objectKey] == nil) {
        return @"";
    } else {
        return [defaults stringForKey:_objectKey];
    }
}

+ (void)setStringValueForConfiguratrionKey:(NSString *)_objectKey withValue:(NSString *)_value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setValue:_value forKey:_objectKey];
    [defaults synchronize];
}

@end
