//
//  PickViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickViewController.h"
#import "PickSegmentedControl.h"
#import "PickRecommendViewController.h"
#import "PickFollowViewController.h"
#import "PickSearchBar.h"
#import <objc/runtime.h>
@interface PickViewController ()<UISearchBarDelegate>

@property (assign, nonatomic) NSInteger selectIndex;
@property (strong, nonatomic) PickRecommendViewController *recommendVC;
@property (strong, nonatomic) PickFollowViewController *followVC;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIViewController *currentController;
//@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) PickSearchBar *searchBar;
@end

@implementation PickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  推荐与 关注
    PickSegmentedControl *control = [[PickSegmentedControl alloc]initWithItems:@[@"推荐 ",@"关注"]];
    control.frame = CGRectMake(0, 0, 100, 30);
    [control addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = control;
    self.selectIndex = 0;
    control.selectedSegmentIndex = 0;
    
    [self.view addSubview:self.searchBar];
    self.searchBar.frame = CGRectMake(30, CGRectGetMaxY(control.frame) + 30, kWindowWidth-60, 35);
    self.searchBar.delegate = self;
    
//    self.searchBar.frame = CGRectMake(30, CGRectGetMaxY(control.frame) + 30, kWindowWidth-60, 35);
//    self.searchBar.placeholder = @"搜索你要找的内容";
//    //self.searchBar.backgroundImage = [UIImage imageNamed:@"bg"];
//    self.searchBar.textFieldSearchBar.backgroundColor = [UIColor clearColor];
//   // self.searchBar.backgroundColor = [UIColor blueColor];
//    self.searchBar.barTintColor = [UIColor whiteColor];
//    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    self.searchBar.showsScopeBar = YES;
//    self.searchBar.delegate = self;
//
    
    unsigned int count;
    Ivar *inarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
    }
    
    self.contentView = [[UIView alloc]init];
    [self.view addSubview:self.contentView];
    self.contentView.frame = CGRectMake(0, 100, kWindowWidth, kWindowHeight - 100-49);
    self.contentView.backgroundColor = [UIColor redColor];
    
    [self addChildViewController:self.recommendVC];
    self.recommendVC.view.frame = CGRectMake(0, 0, kWindowWidth, CGRectGetHeight(self.contentView.frame));
    [self.contentView addSubview:self.recommendVC.view];
    
    [self.recommendVC didMoveToParentViewController:self];
    
    self.currentController = self.recommendVC;
    self.followVC.view.frame = CGRectMake(0, 0, kWindowWidth, CGRectGetHeight(self.contentView.frame));
    
    
}

- (void)buttonAction:(PickSegmentedControl *)control
{
    self.selectIndex = control.selectedSegmentIndex;
    
    [self addChildViewController:self.followVC];
    @weakify(self)
    [self transitionFromViewController:self.currentController toViewController:self.childViewControllers[self.selectIndex] duration:.2f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        @strongify(self)
        [self.followVC didMoveToParentViewController:self];
        self.currentController = self.childViewControllers[self.selectIndex];
        
    }];
}

#pragma mark  UISearchBar





#pragma mark 懒加载
- (PickRecommendViewController *)recommendVC
{
    if (!_recommendVC) {
        _recommendVC = [[PickRecommendViewController alloc]init];
    }
    return _recommendVC;
}

- (PickFollowViewController *)followVC
{
    if (!_followVC) {
        _followVC = [[PickFollowViewController alloc]init];
    }
    return _followVC;
}

- (PickSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[PickSearchBar alloc]init];
    }
    return _searchBar;
}

@end
