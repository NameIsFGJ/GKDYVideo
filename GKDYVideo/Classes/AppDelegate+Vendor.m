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
    
    // 判断是否登录
    [self userLoad];
    
    // 配置NavBar
    [self initializeNavBar];
}

- (void)initializeNavBar
{
    [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure *configure) {
        configure.backStyle             = GKNavigationBarBackStyleWhite;
        configure.titleFont             = [UIFont systemFontOfSize:18.0f];
        configure.titleColor            = kWhiteColor;
        configure.gk_navItemLeftSpace   = 12.0f;
        configure.gk_navItemRightSpace  = 12.0f;
        configure.statusBarStyle        = UIStatusBarStyleLightContent;
    }];
}

- (void)userLoad
{
    kUser.user_token = @"2c15fd2b-6590-4db9-bba2-6506259d6f84";
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
