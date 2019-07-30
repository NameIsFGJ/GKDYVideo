//
//  GKDYPageViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKDYPageViewController.h"
#import "HomeSegmentedControl.h"
#import "GKDYPlayerViewController.h"
#import "FollowingViewController.h"
#import "SearchViewController.h"
@interface GKDYPageViewController ()
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)GKDYPlayerViewController *playVC;
@property (strong, nonatomic)FollowingViewController *followVC;
@property (strong, nonatomic)GKDYBaseViewController *selectVC;
//property (strong, nonatomic)HomeSegmentedControl *control;
@property (assign, nonatomic)NSInteger selectIndex;
@end

@implementation GKDYPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController:self.playVC];
    [self addChildViewController:self.followVC];
    
    self.selectIndex = 0;
    //  推荐与 关注
    HomeSegmentedControl *control1111 = [[HomeSegmentedControl alloc]initWithItems:@[@"推荐 ",@"关注"]];
    control1111.frame = CGRectMake(0, 0, 100, 30);
     [control1111 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control1111;
    self.selectIndex = 0;
    control1111.selectedSegmentIndex = 0;
    
    //搜索
    UIButton *btn = [[UIButton alloc]init];
    btn.frame =CGRectMake(0, 0, 20, 20);//frame 不显示
    [btn setImage:[UIImage imageNamed:@"search"] forState:(UIControlStateNormal)];//不起作用
    [btn addTarget:self action:@selector(pushSearchViewController) forControlEvents:(UIControlEventTouchUpInside)];//不起作用
    UIView *btnView = [[UIView alloc]initWithFrame:btn.frame];
    [btnView addSubview:btn];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btnView];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.playVC.videoView resume];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 取消push代理
   // self.gk_pushDelegate = nil;
     [self.playVC.videoView pause];
    
}

#pragma mark Action

- (void)pushSearchViewController
{
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)buttonAction:(HomeSegmentedControl *)control
{
    self.selectIndex = control.selectedSegmentIndex;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    if (!_selectVC)
    {
        _selectVC = self.childViewControllers[selectIndex];
        _selectVC.view.frame = self.view.frame;
        [self.view addSubview:_selectVC.view];
        [_selectVC didMoveToParentViewController:self];
    }else{
        [self transitionFromViewController:_selectVC toViewController:self.childViewControllers[selectIndex] duration:.1f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
            _selectVC = self.childViewControllers[selectIndex];
            [self.view addSubview:_selectVC.view];
             [_selectVC didMoveToParentViewController:self];
            _selectIndex = selectIndex;
        }];
    }
}

- (GKDYPlayerViewController *)playVC
{
    if (!_playVC)
    {
        _playVC = [GKDYPlayerViewController new];
    }
    return _playVC;
}
- (FollowingViewController *)followVC
{
    if (!_followVC) {
        _followVC = [FollowingViewController new];
    }
    return _followVC;
}

@end
