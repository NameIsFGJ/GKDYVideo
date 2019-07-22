//
//  BaseTabBarController.m
//  FGJ_project
//
//  Created by fgj on 2018/8/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseTabBarController.h"
#import "GKDYPlayerViewController.h"
#import "MarketViewController.h"
#import "AddGoodsViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self initializeTabBar];
    [self setupTabbarItems];
    [self changeBackgroundColor];
}

- (void)initializeTabBar
{
    // 设置title的属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:20.0]}            forState:UIControlStateSelected];
    
  //  [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHex:@"#6E6E6E"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:20.0]}            forState:UIControlStateNormal];
    
    //设置title的位置
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0,-10)];

    self.tabBar.translucent = NO;
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

- (void)setupTabbarItems
{
    UINavigationController *nav1 = [UINavigationController rootVC:[GKDYPlayerViewController new] translationScale:NO];
    nav1.gk_openScrollLeftPush = YES; // 开启左滑push功能
    
    UINavigationController *nav2 = [UINavigationController rootVC:[MarketViewController new] translationScale:NO];
    nav2.gk_openScrollLeftPush = YES; // 开启左滑push功能
    
    UINavigationController *nav3 = [UINavigationController rootVC:[AddGoodsViewController new] translationScale:NO];
    nav3.gk_openScrollLeftPush = YES; // 开启左滑push功能
    
    UINavigationController *nav4 = [UINavigationController rootVC:[MessageViewController new] translationScale:NO];
    nav4.gk_openScrollLeftPush = YES; // 开启左滑push功能
    
    UINavigationController *nav5 = [UINavigationController rootVC:[MineViewController new] translationScale:NO];
    nav5.gk_openScrollLeftPush = YES; // 开启左滑push功能

    nav1.tabBarItem = [self setupTabbarItemTitle:@"首页" image:nil selectedImage:nil];
    nav2.tabBarItem = [self setupTabbarItemTitle:@"商场" image:nil selectedImage:nil];
    nav3.tabBarItem = [self setupTabbarItemTitle:@"" image:@"addGood_seletc" selectedImage:@"addGood"];
    nav4.tabBarItem = [self setupTabbarItemTitle:@"消息" image:nil selectedImage:nil];
    nav5.tabBarItem = [self setupTabbarItemTitle:@"我的" image:nil selectedImage:nil];
    
    // 调整图片
    nav3.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0);
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
}

- (UITabBarItem *)setupTabbarItemTitle:(NSString *)title
                                 image:(NSString *)image
                         selectedImage:(NSString *)imageSel
{
    UIImage *caseImage = [UIImage imageNamed:image];
    UIImage *caseImageSel = [UIImage imageNamed:imageSel];
    
    caseImage = [caseImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    caseImageSel = [caseImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:caseImage selectedImage:caseImageSel];
    return item;
}

@end
