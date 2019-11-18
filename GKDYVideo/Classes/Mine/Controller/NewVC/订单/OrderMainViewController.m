//
//  OrderMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderMainViewController.h"
// 全部订单
#import "NewAllOrderViewController.h"
// 待付款
#import "NewWaitPayViewController.h"
// 待发货
#import "NewWaitSendViewController.h"
// 待收货
#import "NewWaitReceiveViewController.h"
// 待评价
#import "NewWaitAppraiseViewController.h"

#import "NewServceViewController.h"
@interface OrderMainViewController ()
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation OrderMainViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.titleColorSelected = kPickColor;
        self.menuViewStyle = WMMenuViewStyleDefault;
        self.menuItemWidth = kWindowWidth / self.titleArray.count;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self makeNav];
    
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"订单详情";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.3);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark UIPageViewControllerDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, KTopViewHeight, kWindowWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView;
{
    return CGRectMake(0,  KTopViewHeight+40, kWindowWidth, kWindowHeight -KTopViewHeight- 40-88);
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index;
{
    return self.titleArray[index];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController;
{
    return  self.titleArray.count;
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index;
{
    if (index == 0)
    {
        NewAllOrderViewController *vc = [[NewAllOrderViewController alloc]init];
        return vc;

    }
    else if (index == 1)
    {
        NewWaitPayViewController *vc = [[NewWaitPayViewController alloc]init];
        return vc;
    }
    else if (index == 2)
    {
        NewWaitSendViewController *vc = [[NewWaitSendViewController alloc]init];
        return vc;
    }
    else if (index == 3)
    {
        NewWaitReceiveViewController *vc = [[NewWaitReceiveViewController alloc]init];
        return vc;
    }
    else if (index == 4)
    {
        NewWaitAppraiseViewController *vc = [[NewWaitAppraiseViewController alloc]init];
        return vc;
    }
    return nil;
}


- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价", nil];
    }
    return _titleArray;
}

@end
