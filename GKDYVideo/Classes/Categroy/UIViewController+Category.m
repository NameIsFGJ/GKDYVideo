//
//  UIViewController+Category.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UIViewController+Category.h"
#import "GKDYMainViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "BaseNavigationController.h"
@implementation UIViewController (Category)
- (void)showLoginVC:(void(^)(void))finished completion:(void(^)(void))completion;
{
    if ([User isLogin])
    {
        if (finished)
        {
            finished();
        }
        return;
    }
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
