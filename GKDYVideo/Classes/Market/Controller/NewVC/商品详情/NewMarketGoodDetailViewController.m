//
//  NewMarketGoodDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/18.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketGoodDetailViewController.h"
// 宝贝
#import "GoodDetailView0.h"
// 评价
#import "GoodDetailView1.h"
// 详情
#import "GoodDetailView2.h"
// 推荐
#import "GoodDetailView3.h"
// 底部
#import "GoodDetailView4.h"
// 优惠券
#import "GoodDetailDisCountView.h"
// 商品属性
#import "InfoGoodView.h"
// 购物车
#import "NewMarketShopCartViewController.h"
@interface NewMarketGoodDetailViewController ()<GoodDetailView0Delegate,GoodDetailView1Delegate,GoodDetailView3Delegate,GoodDetailView4Delegate>
@property (strong, nonatomic) UIView *navView;
@property (strong, nonatomic) GoodDetailDisCountView *discountView;
@property (strong, nonatomic) InfoGoodView *infoView;
@end

@implementation NewMarketGoodDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"";
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
    UIScrollView *mainView = [[UIScrollView alloc]init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.bottom.mas_equalTo(-50);
    }];
    
    UIView *contentView = [[UIView alloc]init];
    [mainView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(mainView);
        make.width.equalTo(mainView);
    }];
    
    GoodDetailView0 *view0 = [[GoodDetailView0 alloc]init];
    [contentView addSubview:view0];
    
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(0);
                make.height.mas_equalTo(690);
            }];
    view0.delegate = self;
    
    GoodDetailView1 *view1 = [[GoodDetailView1 alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.height.mas_equalTo(500);
    }];
    view1.delegate = self;
    
    GoodDetailView2 *view2 = [[GoodDetailView2 alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom);
        make.height.mas_equalTo(640);
    }];
    
    GoodDetailView3 *view3 = [[GoodDetailView3 alloc]init];
    [contentView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom);
        make.height.mas_equalTo(1200);
    }];
    view3.delegate = self;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view3);
    }];
    
    GoodDetailView4 *view4 = [[GoodDetailView4 alloc]init];
    [self.view addSubview:view4];
    view4.delegate = self;
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    self.discountView = [[GoodDetailDisCountView alloc]init];
    [self.view addSubview:self.discountView];
    [self.discountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.discountView.hidden = YES;
    
    self.infoView = [[InfoGoodView alloc]init];
    [self.view addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.view);
    }];
    //@weakifly(self)
    @weakify(self)
    self.infoView.block = ^{
        
        @strongify(self)
            NewMarketShopCartViewController *vc = [[NewMarketShopCartViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];

    };
    self.infoView.hidden = YES;
    
}

#pragma mark View0Delegate
- (void)view0WithBannerClick:(NSInteger)index;
{
    NSLog(@"点击---%ld",index);
}
- (void)view0WithMemberClick;
{
    NSLog(@"会员");
}
- (void)view0WithDiscountClick;
{
    NSLog(@"优惠券");
    self.discountView.hidden = NO;
    [self.discountView animation];
}
- (void)view0WithShopClick;
{
    NSLog(@"进店");
    
}

#pragma mark View1Delegate

- (void)view1WithCommentView;
{
    NSLog(@"点评");
}
#pragma mark View3Delegate
- (void)view3WithCollectionViewClick:(NSInteger)index;
{
    NSLog(@"delegate index = %ld",index);
}

#pragma mark View4Delegate

- (void)view4WithShopClick:(NSInteger)shopID;
{
    NSLog(@"delegate 点击商铺");
}
- (void)view4WithService;
{
     NSLog(@"delegate 点击客服");
}
- (void)view4WithShopCart;
{
     NSLog(@"delegate 点击购物车");
}
- (void)view4WithAddCartClick:(NSInteger)goodID;
{
     NSLog(@"delegate 点击加入购物车");
    self.infoView.hidden = NO;
    [self.infoView animation];
}
- (void)view4WithBuyClick:(NSInteger)goodID;
{
     NSLog(@"delegate 点击立即购买");
}

@end
