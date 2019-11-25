//
//  NewMarketViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/8.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketViewController.h"
#import "PickSearchBar.h"
#import "PickSegmentedControl.h"
#import "RankListViewController.h"
#import "LegalCopyViewController.h"
#import "NewMarketGoodDetailViewController.h"
typedef enum : NSUInteger {
    AnimationDirectionForward,
    AnimationDirectionReverse,
} AnimationDirection;

@interface NewMarketViewController ()<SDCycleScrollViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (strong, nonatomic) PickSearchBar *searchBar;
@property (strong, nonatomic) SDCycleScrollView *scrollView;
@property (strong, nonatomic) PickSegmentedControl *control;
@property (strong, nonatomic) RankListViewController *rankListVC;
@property (strong, nonatomic) LegalCopyViewController *legalCopyVC;
@property (strong, nonatomic) UIPageViewController *pageVC;
@property (strong, nonatomic) UIViewController *currentVC;
@property (assign, nonatomic) NSInteger selectIndex;
@property (strong, nonatomic) UIView *pageView;
@property (assign, nonatomic) BOOL showOrHide;
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) NSArray *arrayVC;
@end

@implementation NewMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.selectIndex = 0;
    self.showOrHide = YES;
    
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    self.topView = [[UIView alloc]init];
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(NAVBAR_HEIGHT);
        
    }];
    
    UIView *navView = [[UIView alloc]init];
    [self.topView addSubview:navView];
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(NAVBAR_HEIGHT);
        
    }];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [navView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(STATUSBAR_HEIGHT);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [leftButton setTitle:@"分类" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [navView addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(navView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(250, 30));
        make.top.mas_equalTo(leftButton.mas_top);
    }];
    
}

- (void)makeUI
{
    UIScrollView *mainView = [[UIScrollView alloc]init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.topView.mas_bottom);
    }];
    mainView.backgroundColor = [UIColor whiteColor];
    
    UIView *contentView = [[UIView alloc]init];
    [mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(mainView);
        make.width.equalTo(mainView);
    }];
    
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];

    UIImageView *imageView = [[UIImageView alloc]init];
    [view0 addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(view0.mas_centerY).offset(0);
    }];
    imageView.image = [UIImage imageNamed:@"legalCopy"];

    UILabel *label = [[UILabel alloc]init];
    [view0 addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(5);
        make.centerY.equalTo(view0.mas_centerY).offset(0);
    }];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"正版保障,假一赔十";
    
    UIButton * pushLegalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:pushLegalButton];
    [pushLegalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.centerY.equalTo(view0.mas_centerY).offset(0);
    }];
    [pushLegalButton setTitle:@"查看详情 >" forState:UIControlStateNormal];
    pushLegalButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [pushLegalButton setTitleColor:kPickColor forState:UIControlStateNormal];

    [contentView addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(view0.mas_bottom).offset(0);
        make.height.mas_equalTo(150);
    }];

    UIButton *memberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:memberButton];
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(self.scrollView.mas_bottom).offset(12);
        make.height.mas_equalTo(44);
    }];
    [memberButton setImage:[UIImage imageNamed:@"memberImage"] forState:UIControlStateNormal];

    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(memberButton.mas_bottom).offset(12);
        make.height.mas_equalTo(70);
    }];

    NSArray *titleArray = @[@"周边",@"原创",@"道具",@"手办",@"原创"];
    NSArray *imageArray = @[@"z_icon",@"yk",@"dj_icon",@"sb_icon",@"yc_icon"];

    for (int i = 0; i < 5; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view2 addSubview:btn];

        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i * (kWindowWidth/5 -2));
            make.size.mas_equalTo(CGSizeMake(kWindowWidth/5-15, 90));
            make.top.mas_equalTo(0);
        }];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];

        UIImageView *imageView = [[UIImageView alloc]init];
        [btn addSubview:imageView];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(20);
        }];
        imageView.contentMode = UIViewContentModeCenter;
        UILabel *label = [[UILabel alloc]init];
        [btn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(imageView.mas_bottom).offset(10);
        }];
        label.text = titleArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
    }


    [contentView addSubview:self.control];
    [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 40));
        make.top.equalTo(view2.mas_bottom).offset(20);
        make.centerX.equalTo(view2.mas_centerX).offset(0);
    }];
    [self.control addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];

    self.pageView = [[UIView alloc]init];
    [contentView addSubview:self.pageView];
    [self.pageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.equalTo(self.control.mas_bottom);
        make.height.mas_equalTo(191 * 12);
        //make.bottom.mas_equalTo(0);
       // make.top.equalTo(self.topView.mas_bottom).offset(10);
    }];
    self.pageView.backgroundColor = [UIColor orangeColor];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pageView);
    }];
    
    [self addChildViewController:self.pageVC];
    [self.pageView addSubview:self.pageVC.view];
    [self.pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

- (void)buttonAction:(PickSegmentedControl *)control
{
    UIViewController *vc = self.arrayVC[control.selectedSegmentIndex];
    NSArray *array = [NSArray arrayWithObject:vc];
    
    
    if ([vc isEqual:self.legalCopyVC])
    {
        [self.pageVC setViewControllers:array
                              direction:UIPageViewControllerNavigationDirectionReverse
                               animated:YES
                             completion:nil];
    }
    else
    {
        [self.pageVC setViewControllers:array
                              direction:UIPageViewControllerNavigationDirectionForward
                               animated:YES
                             completion:nil];
    }
}

#pragma mark ScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击第%ld图片",index);
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}


#pragma mark UIPageViewController
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed;
{
    if (!completed) {
        return;
    }
    if ([previousViewControllers.firstObject isEqual:self.rankListVC]) {
        
    }else
    {
        
    }
}

- (void)startAnimationWithDirection:(AnimationDirection)direction
{
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController;
{
    if ([viewController isEqual:self.rankListVC]) {
        return nil;
    }else
    {
        return self.legalCopyVC;
    }
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isEqual:self.legalCopyVC]) {
        return nil;
    }else
    {
        return self.rankListVC;
    }
}

#pragma makr legalCopyDelegate
- (void)legalCopyTableViewDidSelect:(NSInteger)indexRow;
{
    
    NewMarketGoodDetailViewController *vc = [[NewMarketGoodDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (BOOL)setupTarbarHidden
{
    return NO;
}

#pragma mark loazyLoad
- (PickSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[PickSearchBar alloc]init];
    }
    return _searchBar;
}

- (SDCycleScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[SDCycleScrollView alloc]init];
        _scrollView.localizationImageNamesGroup = @[@"banner",@"banner"];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (LegalCopyViewController *)legalCopyVC
{
    if (!_legalCopyVC) {
        _legalCopyVC = [[LegalCopyViewController alloc]init];
    }
    return _legalCopyVC;
}

- (UIPageViewController *)pageVC
{
    if (!_pageVC) {
        _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [_pageVC setViewControllers:@[self.legalCopyVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    return _pageVC;
}

- (RankListViewController *)rankListVC
{

    if (!_rankListVC) {
        _rankListVC = [[RankListViewController alloc]init];
    }
    return _rankListVC;
}

- (PickSegmentedControl *)control
{
    if (!_control) {
        _control = [[PickSegmentedControl alloc]initWithItems:@[@"正品",@"排行榜"]];
    }
    return _control;
}

- (NSArray *)arrayVC
{
    if (!_arrayVC) {
        _arrayVC = [NSArray arrayWithObjects:self.legalCopyVC,self.rankListVC, nil];
    }
    return _arrayVC;
}
@end
