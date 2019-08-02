//
//  GKDYMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/18.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYMainViewController.h"
#import "GKDYPlayerViewController.h"
#import "MarketViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "UIImage+GKcategory.h"
#import "GKDYHomeViewController.h"
#import "GKDYPageViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "AddGoodsViewController.h"
@interface GKDYMainViewController ()<UITabBarControllerDelegate>

@end

@implementation GKDYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.gk_statusBarHidden = NO;
    [self changeBackgroundColor];
    
    [self addChildVC:[GKDYPageViewController new] withTitle:@"首页"];
    [self addChildVC:[MarketViewController new] withTitle:@"商城"];
    [self addChildVC:[AddGoodsViewController new] withImage:@"addGood" withSelectImage:@"addGood_select"];
    [self addChildVCWithHasNewMessage:[MessageViewController new] withTitle:@"消息"];
    [self addChildVC:[MineViewController new] withTitle:@"我"];
}

- (void)changeBackgroundColor
{
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = [UIColor blackColor];
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
}

// 添加w文字
- (void)addChildVC:(UIViewController *) childVC withTitle:(NSString *) title{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(36, 3)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(36, 3)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -14);
    childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(28, 0, -28, 0);
    
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: kWhiteColor} forState:UIControlStateSelected];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

// 添加图片
- (void)addChildVC:(UIViewController *) childVC withImage:(NSString *) image withSelectImage:(NSString *) selectImage {
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -14);
    childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0);
    
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: kWhiteColor} forState:UIControlStateSelected];
    
       BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

// 添加小红点
- (void)addChildVCWithHasNewMessage:(UIViewController *) childVC withTitle:(NSString *) title{
    childVC.tabBarItem.title = title;
    //childVC.tabBarItem.image = [[UIImage imageWithColor:[UIColor orangeColor] size:CGSizeMake(36, 3)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *cornerImageView = [[UIImageView alloc]init];
    cornerImageView.image = [[UIImage imageWithColor:[UIColor orangeColor] size:CGSizeMake(3, 3)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cornerImageView.layer.cornerRadius = 3;
    cornerImageView.clipsToBounds = YES;
    childVC.tabBarItem.image = cornerImageView.image;
    childVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -14);
    childVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, 0,5, -36);
    
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0f], NSForegroundColorAttributeName: kWhiteColor} forState:UIControlStateSelected];
    
     BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childVC];
    nav.gk_openScrollLeftPush = YES;
    [self addChildViewController:nav];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{

//    NSString *string1 = [[NSUserDefaults standardUserDefaults] stringForKey:@"com.manfan.user_token"];
//       NSString *string2 = [[NSUserDefaults standardUserDefaults] stringForKey:@"com.manfan.user_id"];
//       NSString *string3 = [[NSUserDefaults standardUserDefaults] stringForKey:@"com.manfan.mobile"];
    BaseNavigationController * nav = (BaseNavigationController *)viewController;
    if ([[nav.viewControllers lastObject] isKindOfClass:[MineViewController class]])
    {
        // 未登录
        if (![User isLogin])
        {
            BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:[LoginViewController alloc]];
            [self presentViewController:nav animated:YES completion:nil];
            return NO;
        }
    }
    return YES;
}

@end
