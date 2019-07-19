//
//  NSBundle+category.m
//  FGJ_project
//
//  Created by fgj on 2018/11/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSBundle+category.h"

@implementation NSBundle (category)
- (NSString *)zx_appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)zx_appLongVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
@end
