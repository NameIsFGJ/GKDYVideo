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
@interface NewMarketViewController ()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) PickSearchBar *searchBar;
@property (strong, nonatomic) SDCycleScrollView *scrollView;
@property (strong, nonatomic) PickSegmentedControl *control;
//@property (strong, nonatomic) RankListViewController *rankListVC;
@property (strong, nonatomic) LegalCopyViewController *legalCopyVC;
@property (strong, nonatomic) LegalCopyViewController *rankListVC;
@property (strong, nonatomic) UIViewController *currentVC;
@property (assign, nonatomic) NSInteger selectIndex;
@property (strong, nonatomic) UIView *contentView;
@property (assign, nonatomic) BOOL showOrHide;
@property (strong, nonatomic) UIView *topView;

@end

@implementation NewMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
    self.selectIndex = 0;
    self.showOrHide = YES;
    [self makeUI];
}

- (void)makeUI
{
    
    self.topView = [[UIView alloc]init];
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(400 + NAVBAR_HEIGHT);
        
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
    
    UIView *view0 = [[UIView alloc]init];
    [self.topView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(navView.mas_bottom);
        make.height.mas_equalTo(50);
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
    
    [self.topView addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(view0.mas_bottom).offset(0);
        make.height.mas_equalTo(150);
    }];
    
    UIButton *memberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:memberButton];
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(self.scrollView.mas_bottom).offset(12);
        make.height.mas_equalTo(44);
    }];
    [memberButton setImage:[UIImage imageNamed:@"memberImage"] forState:UIControlStateNormal];
    
    UIView *view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
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
    
    
    [self.topView addSubview:self.control];
    [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 40));
        make.top.equalTo(view2.mas_bottom).offset(20);
        make.centerX.equalTo(view2.mas_centerX).offset(0);
    }];
    [self.control addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    
    self.contentView = [[UIView alloc]init];
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.equalTo(self.topView.mas_bottom).offset(10);
    }];
}

- (void)buttonAction:(PickSegmentedControl *)control
{
    self.selectIndex = control.selectedSegmentIndex;
    
    [self addChildViewController:self.legalCopyVC];
    @weakify(self)
    [self transitionFromViewController:self.currentVC toViewController:self.childViewControllers[self.selectIndex] duration:.2f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        @strongify(self)
        
        [self.legalCopyVC didMoveToParentViewController:self];
        self.currentVC = self.childViewControllers[self.selectIndex];
        
    }];
    
}

- (void)viewDidLayoutSubviews
{
    [self addChildViewController:self.rankListVC];
    self.rankListVC.view.frame = CGRectMake(0, 0, kWindowWidth, CGRectGetHeight(self.contentView.frame));
    [self.contentView addSubview:self.rankListVC.view];
    [self.rankListVC didMoveToParentViewController:self];
    self.currentVC = self.rankListVC;
    self.legalCopyVC.view.frame = CGRectMake(0, 0, kWindowWidth, CGRectGetHeight(self.contentView.frame));
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
    @weakify(self)
    if (!_legalCopyVC) {
        _legalCopyVC = [[LegalCopyViewController alloc]init];
        _legalCopyVC.view.backgroundColor = [UIColor redColor];
        _legalCopyVC.block = ^(BOOL showOrHide) {
            if (self.showOrHide != showOrHide) {
                [UIView animateWithDuration:.3 animations:^{
                    @strongify(self)
                    if (!showOrHide) {
                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.height.mas_equalTo(0);

                        }];
                    }else
                    {
                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.height.mas_equalTo(400 + NAVBAR_HEIGHT);
                        }];
                    }
                    [self.view layoutIfNeeded];
                } completion:^(BOOL finished) {
                    @strongify(self)
                    self.showOrHide = showOrHide;
                }];
            }
        };
    }
    return _legalCopyVC;
}

- (LegalCopyViewController *)rankListVC
{
    @weakify(self)
    if (!_rankListVC) {
        _rankListVC = [[LegalCopyViewController alloc]init];
        _rankListVC.block = ^(BOOL showOrHide) {
            if (self.showOrHide != showOrHide) {
                [UIView animateWithDuration:.3 animations:^{
                    @strongify(self)
                    if (!showOrHide) {
                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.height.mas_equalTo(0);
                            
                        }];
                    }else
                    {
                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.height.mas_equalTo(400 + NAVBAR_HEIGHT);
                        }];
                    }
                    [self.view layoutIfNeeded];
                } completion:^(BOOL finished) {
                    @strongify(self)
                    self.showOrHide = showOrHide;
                }];
            }
        };
    }
    return _rankListVC;
}



//- (RankListViewController *)rankListVC
//{
//    @weakify(self)
//    if (!_rankListVC) {
//        _rankListVC = [[RankListViewController alloc]init];
//        _rankListVC.block = ^(BOOL showOrHide) {
//            if (self.showOrHide != showOrHide) {
//                [UIView animateWithDuration:.3 animations:^{
//                    @strongify(self)
//                    if (!showOrHide) {
//                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
//                            make.height.mas_equalTo(0);
//
//                        }];
//                    }else
//                    {
//                        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
//                            make.height.mas_equalTo(400 + NAVBAR_HEIGHT);
//                        }];
//                    }
//                    [self.view layoutIfNeeded];
//                } completion:^(BOOL finished) {
//                    @strongify(self)
//                    self.showOrHide = showOrHide;
//                }];
//            }
//        };
//    }
//    return _rankListVC;
//}

- (PickSegmentedControl *)control
{
    if (!_control) {
        _control = [[PickSegmentedControl alloc]initWithItems:@[@"正品",@"排行榜"]];
    }
    return _control;
}

@end
