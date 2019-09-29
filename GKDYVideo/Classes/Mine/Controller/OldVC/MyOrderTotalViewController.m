//
//  MyOrderTotalViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyOrderTotalViewController.h"
#import "MyBusinessViewController.h"
@interface MyOrderTotalViewController ()
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation MyOrderTotalViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 17;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = kWindowWidth / self.titleArray.count;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark UIPageViewControllerDelegate
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, 64, kWindowWidth, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView;
{
    return CGRectMake(0, 104, kWindowWidth, kWindowHeight - 104);
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
        MyBusinessViewController *togetherVC = [[MyBusinessViewController alloc]init];
        togetherVC.type = buyType;
        togetherVC.status = sonVC;
        togetherVC.view.tag = 200;
        return togetherVC;
    }else if (index == 1){
        MyBusinessViewController *userVC = [[MyBusinessViewController alloc]init];
        userVC.type = sellTyle;
         userVC.status = sonVC;
        userVC.view.tag = 201;
        return userVC;
    }else if (index == 2){
        MyBusinessViewController *musicVC = [[MyBusinessViewController alloc]init];
        musicVC.view.tag = 202;
        return musicVC;
    }else{
        MyBusinessViewController *topicVC = [[MyBusinessViewController alloc]init];
        topicVC.view.tag = 203;
        return topicVC;
    }
}


- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"我买到的",@"我卖出的", nil];
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
