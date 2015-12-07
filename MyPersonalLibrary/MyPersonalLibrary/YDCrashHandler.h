//
//  YDCrashHandler.h
//  MyPersonalLibrary
//
//  Created by 王珏 on 15/12/7.
//  Copyright © 2015年 王珏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDCrashHandler : NSObject
{
    BOOL dismissed;
}

void InstallCrashExceptionHandler();

@end
