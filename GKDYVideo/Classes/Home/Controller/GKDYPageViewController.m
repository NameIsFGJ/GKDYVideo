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
#import "GKDYSearchViewController.h"
@interface GKDYPageViewController ()
@property (strong, nonatomic)NSArray *itemsArray;
@property (strong, nonatomic)GKDYPlayerViewController *playVC;
@property (strong, nonatomic)GKDYSearchViewController *searchVC;
@property (strong, nonatomic)GKDYBaseViewController *selectVC;
//property (strong, nonatomic)HomeSegmentedControl *control;
@property (assign, nonatomic)NSInteger selectIndex;
@end

@implementation GKDYPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.gk_statusBarHidden = YES;
    
    [self addChildViewController:self.playVC];
    [self addChildViewController:self.searchVC];
    self.selectIndex = 0;
    HomeSegmentedControl *control1111 = [[HomeSegmentedControl alloc]initWithItems:@[@"推荐 ",@"关注"]];
     [control1111 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control1111;
    NSLog(@"self.control  =%p",control1111);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.playVC.videoView resume];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
  //  self.gk_navLineHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 取消push代理
   // self.gk_pushDelegate = nil;
    [self.playVC.videoView pause];
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

- (GKDYSearchViewController *)searchVC
{
    if (!_searchVC)
    {
        _searchVC = [GKDYSearchViewController new];
       
    }
    return _searchVC;
}


@end
