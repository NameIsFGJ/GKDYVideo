//
//  NewMarketShopPaySuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMarketShopPaySuccessViewController.h"

@interface NewMarketShopPaySuccessViewController ()

@end

@implementation NewMarketShopPaySuccessViewController

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
    label.text = @"支付完成";
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
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kWindowWidth, 130));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-30);
    }];
    //view0.backgroundColor = [UIColor blueColor];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.top.mas_equalTo(0);
    }];
    label0.text = @"订单支付成功";
    label0.font = [UIFont systemFontOfSize:20];
    
    UILabel *label1 = [[UILabel alloc]init];
    [view0 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.top.equalTo(label0.mas_bottom).offset(15);
    }];
    label1.text = @"¥2959.50";
    label1.font = [UIFont systemFontOfSize:25];
    
    UILabel *label2 = [[UILabel alloc]init];
    [view0 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.top.equalTo(label1.mas_bottom).offset(15);
        
    }];
    label2.text = @"仓库正在为您备货中";
    label2.font = [UIFont systemFontOfSize:14];
    
    
   
    
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.equalTo(view0.mas_top);
        make.height.mas_equalTo(100);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dd_icon"]];
    [view1 addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.centerX.equalTo(view1.mas_centerX);
        make.top.mas_equalTo(0);
    }];
   // imageView.backgroundColor = kPickColor;
    
    UIView *view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom);
        make.height.mas_equalTo(60);
    }];
    

    UIButton *checkOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:checkOrderButton];
    [checkOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view2.mas_centerY);
         make.height.mas_equalTo(40);
    }];
    checkOrderButton.layer.borderColor = [UIColor blackColor].CGColor;
    checkOrderButton.layer.borderWidth = .5;
    [checkOrderButton setTitle:@"查看订单" forState:UIControlStateNormal];
    [checkOrderButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkOrderButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [checkOrderButton addTarget:self action:@selector(checkOrderButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view2.mas_centerY);
        make.height.mas_equalTo(40);
    }];
    [backButton setTitle:@"返回订单" forState:UIControlStateNormal];
    backButton.layer.borderColor = [UIColor blackColor].CGColor;
    backButton.layer.borderWidth = .5;
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    NSArray *array = @[checkOrderButton,backButton];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:60 leadSpacing:40 tailSpacing:40];
}

- (void)checkOrderButtonAction
{
    NSLog(@"查看订单");
}

- (void)backButtonAction
{
     NSLog(@"返回订单");
}


@end
