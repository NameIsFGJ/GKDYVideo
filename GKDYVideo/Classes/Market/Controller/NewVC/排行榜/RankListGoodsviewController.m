//
//  RankListGoodsviewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "RankListGoodsviewController.h"
#import "PickSearchBar.h"
#import "LegalListSelectView.h"
#import "LegalListSonSelectView.h"

@interface RankListGoodsviewController ()<UINavigationControllerDelegate,LegalListSelectViewDelegate>
@property (strong, nonatomic) PickSearchBar *searchBar;
@property (strong, nonatomic) LegalListSelectView *selectView;
@property (strong, nonatomic) LegalListSonSelectView *sonView;

@end

@implementation RankListGoodsviewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.delegate = self;
    
    [self makeUI];
    
}

- (void)makeUI
{
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(KTopViewHeight);
    }];
    view0.backgroundColor = kPickColor;
    UIButton * popButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:popButton];
    
    [popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.bottom.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [popButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [view0 addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.bottom.equalTo(popButton.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(240, 45));
    }];
    
    [self.view addSubview:self.selectView];
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
    
    self.sonView = [[LegalListSonSelectView alloc]init];
    [self.view addSubview:self.sonView];
    self.sonView.frame = CGRectMake(kWindowWidth, 0, kWindowWidth, kWindowHeight);
    
    @weakify(self)
    self.sonView.block = ^{
        @strongify(self)
        [UIView animateWithDuration:.5 animations:^{
            self.sonView.frame = CGRectMake(kWindowWidth, 0, kWindowWidth, kWindowHeight);
        }];
    };
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)buttonAction
{
    NSLog(@"阿萨德发阿斯顿发生的");
}

#pragma mark UINavigationDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    BOOL isShowBar = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowBar animated:YES];
}

#pragma mark sonViewDelegate

- (void)showSonSelectView;
{
    NSLog(@"delegate");
    [UIView animateWithDuration:.5 animations:^{
         self.sonView.frame = CGRectMake(0, 0, kWindowWidth, kWindowHeight);
    }];
}

#pragma mark lazyLoad

- (LegalListSelectView *)selectView
{
    if (!_selectView) {
        _selectView = [[LegalListSelectView alloc]init];
        _selectView.delegate = self;
    }
    return _selectView;
}

- (PickSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[PickSearchBar alloc]init];
    }
    return _searchBar;
}



@end
