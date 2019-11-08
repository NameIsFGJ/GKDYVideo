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

@interface RankListGoodsviewController ()<UINavigationControllerDelegate>
@property (strong, nonatomic) PickSearchBar *searchBar;
@property (strong, nonatomic) LegalListSelectView *selectView;
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
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)buttonAction
{
    NSLog(@"阿萨德发生的");
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    BOOL isShowBar = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowBar animated:YES];
}


#pragma mark lazyLoad

- (LegalListSelectView *)selectView
{
    if (!_selectView) {
        _selectView = [[LegalListSelectView alloc]init];
    }
    return _selectView;
}

- (PickSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[PickSearchBar alloc]init];
        //_searchBar.backgroundColor = kWhiteColor;
        // _searchBa = kWhiteColor;
    }
    return _searchBar;
}
@end
