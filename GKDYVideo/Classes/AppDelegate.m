//
//  AppDelegate.m
//  GKDYVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Vendor.h"
#import <AlipaySDK/AlipaySDK.h>
#import "NewLoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = kWhiteColor;

    self.main = [GKDYMainViewController new];
    
    self.window.rootViewController = self.main;
    [self.window makeKeyAndVisible];
    
    [self initializeVendorWithApplication:application];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //13735887308
    //shanshan944675
    //短视频APP平台应具备哪些资质证明？都有网络文化经营许可证(文网文)、信息网络传播视听节目许可证、广播电视节目制作经营许可证，
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark  支付宝回调

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString*, id> *)options
{
   
    @weakify(self)
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            @strongify(self)
            if ([resultDic[@"resultStatus"]integerValue] == 9000) {
                [self showSuccessMsg:@"支付成功"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"AliPaySuccess" object:nil];
            }else if ([resultDic[@"resultStatus"] integerValue] == 6001)
            {
                [self showErrorMsg:@"取消支付"];
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"AliPaySuccess" object:nil];
            }else if ([resultDic[@"resultStatus"] integerValue] == 6002)
            {
                [self showErrorMsg:@"网络连接错误"];
            }else if ([resultDic[@"resultStatus"] integerValue] == 4000)
            {
                [self showErrorMsg:@"订单支付失败"];
            }
        }];
    }
    return YES;
}

@end
