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
// 新版本
#import "PickViewController.h"
#import "NewMineViewController.h"
#import "NewMarketViewController.h"
#import "NewFriendsViewController.h"
#import "NewLoginViewController.h"
@interface GKDYMainViewController ()<UITabBarControllerDelegate>

@end

@implementation GKDYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.translucent = NO;
    self.gk_statusBarHidden = NO;
    [self changeBackgroundColor];
    
    [self addChildVC:[PickViewController new] withTitle:@"种草" withImage:@"table1" withSelectImage:@"tab_1_selected"];
    [self addChildVC:[NewMarketViewController new] withTitle:@"餐厅" withImage:@"table2" withSelectImage:@"tab_2_selected"];
    [self addChildVC:[AddGoodsViewController new] withImage:@"_s-jia_icon" withSelectImage:@"_s-jia_icon"];
    [self addChildVC:[NewFriendsViewController new] withTitle:@"饭圈" withImage:@"table3" withSelectImage:@"tab_3_selected"];
    [self addChildVC:[NewMineViewController new] withTitle:@"米仓" withImage:@"table4" withSelectImage:@"tab_4_selected"];
    
}

- (void)changeBackgroundColor
{
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
}

// 添加 图片以及文字
- (void)addChildVC:(UIViewController *)childVC withTitle:(NSString *)title withImage:(NSString *)image withSelectImage:(NSString *)selectImage
{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0,0);
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f], NSForegroundColorAttributeName: [UIColor colorWithHex:@"#000000"]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f], NSForegroundColorAttributeName: kPickColor} forState:UIControlStateSelected];
    
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

// 添加文字
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
    BaseNavigationController * nav = (BaseNavigationController *)viewController;
    if ([[nav.viewControllers lastObject] isKindOfClass:[NewMineViewController class]])
    {
//        // 未登录
//        if (![User isLogin])
//        {
//            BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:[LoginViewController alloc]];
//            [self presentViewController:nav animated:YES completion:nil];
//            return NO;
//        }
        
//        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:[NewLoginViewController alloc]];
//        [self presentViewController:nav animated:YES completion:nil];
//        return NO;
        
        
    }
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    if (isIPhoneXAll) {
//        if (@available(iOS 11.0, *)){
//
//        }
        // 修改tabBra的frame
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height -64;
        self.navigationController.tabBarController.tabBar.frame = frame;
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    if (isIPhoneXAll) {
        CGRect frame = self.tabBarController.tabBar.frame;
                    frame.origin.y = [UIScreen mainScreen].bounds.size.height -64;
                    self.navigationController.tabBarController.tabBar.frame = frame;
//        if (@available(iOS 11.0, *)){
//            // 修改tabBra的frame
//            CGRect frame = self.tabBarController.tabBar.frame;
//            frame.origin.y = [UIScreen mainScreen].bounds.size.height -64;
//            self.navigationController.tabBarController.tabBar.frame = frame;
//        }
        
    }
    
}
@end
