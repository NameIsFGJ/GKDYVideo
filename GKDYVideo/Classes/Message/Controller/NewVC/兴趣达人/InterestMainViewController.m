//
//  InterestMainViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "InterestMainViewController.h"
#import "InterestKitsViewController.h"
#import "InterestFoodViewController.h"
#import "InterestCosViewController.h"

@interface InterestMainViewController ()
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation InterestMainViewController
- (instancetype)init
{
    if (self = [super init]) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.titleColorSelected = [UIColor whiteColor];
        self.titleColorNormal = [UIColor lightGrayColor];
        self.menuViewStyle = WMMenuViewStyleDefault;
        self.menuItemWidth = kWindowWidth / self.titleArray.count;
       // self.menuView.scrollView
//        UIView *bgView = [[UIView alloc]init];
//        bgView.backgroundColor = kMainColor;
//        [self.menuView addSubview:bgView];
//        bgView.frame = CGRectMake(0, 0, kWindowWidth, 40);
//
    }
    return self;
}

- (void)viewDidLoad {
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
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"InterestBanner"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(165);
    }];
}

#pragma mark UIPageViewControllerDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    menuView.backgroundColor = kMainColor;
    return CGRectMake(0, KTopViewHeight+164, kWindowWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView;
{
    return CGRectMake(0,  KTopViewHeight+40+164, kWindowWidth, kWindowHeight -KTopViewHeight- 40-88-164);
}

//- (WMMenuItem *)menuView:(WMMenuView *)menu initialMenuItem:(WMMenuItem *)initialMenuItem atIndex:(NSInteger)index;
//{
////    WMMenuItem *item = [[WMMenuItem alloc]init];
////    item.backgroundColor = kMainColor;
////    return item;
//    menu.backgroundColor = kMainColor;
//    return nil;
//}

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
        InterestKitsViewController *vc = [[InterestKitsViewController alloc]init];
        return vc;
        
    }else if (index == 1)
    {
        InterestFoodViewController *vc = [[InterestFoodViewController alloc]init];
        return vc;
    }else if (index == 2)
    {
        InterestCosViewController *vc = [[InterestCosViewController alloc]init];
        return vc;
    }else if (index == 3)
    {
        InterestCosViewController *vc = [[InterestCosViewController alloc]init];
        return vc;
    }else if (index == 4)
    {
        InterestCosViewController *vc = [[InterestCosViewController alloc]init];
        return vc;
    }else if (index == 5)
    {
        InterestCosViewController *vc = [[InterestCosViewController alloc]init];
        return vc;
    }else if (index == 6)
    {
        InterestCosViewController *vc = [[InterestCosViewController alloc]init];
        return vc;
    }
    return nil;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"手办",@"周边",@"美食",@"COS",@"周边",@"美食",@"周边", nil];
    }
    return _titleArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
