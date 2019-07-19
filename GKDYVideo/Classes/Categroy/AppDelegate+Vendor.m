//
//  AppDelegate+Vendor.m
//  FGJ_project
//
//  Created by fgj on 2018/8/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppDelegate+Vendor.h"

@implementation AppDelegate (Vendor)

- (void)initializeVendorWithApplication:(UIApplication *)application;
{
    // 判断有无网络
    [self initializeAFNetworkActivityIndicatorManager];
    
    // 配置 IQKeyboardManager
    [self initializeIQKeyboard];
}

- (void)initializeAFNetworkActivityIndicatorManager
{
    //    电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //    检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //self.onLine = YES;
                NSLog(@"有网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                //self.onLine = NO;
                NSLog(@"没有网络");
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)initializeIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}

@end
