//
//  OrderReturnFalseViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderReturnFalseViewController.h"

@interface OrderReturnFalseViewController ()

@end

@implementation OrderReturnFalseViewController

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
    label.text = @"订单详情";
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
    UILabel *tipLabel1 = [[UILabel alloc]init];
    [self.view addSubview:tipLabel1];
    [tipLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight+80);
    }];
    tipLabel1.textAlignment = NSTextAlignmentCenter;
    tipLabel1.text = @"买家关闭了这笔交易";
    tipLabel1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:24];
    
    UILabel *tipLabel2 = [[UILabel alloc]init];
    [self.view addSubview:tipLabel2];
    [tipLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(tipLabel1.mas_bottom).offset(35);
    }];
    tipLabel2.text = @"¥199.99";
    tipLabel2.textAlignment = NSTextAlignmentCenter;
    tipLabel2.font = [UIFont systemFontOfSize:30];
    tipLabel2.textColor = [UIColor lightGrayColor];
    
    UILabel *tipLabel3 = [[UILabel alloc]init];
    [self.view addSubview:tipLabel3];
    [tipLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(tipLabel2.mas_bottom).offset(12);
    }];
    tipLabel3.text = @"买家已关闭";
    tipLabel3.textAlignment = NSTextAlignmentCenter;
    tipLabel3.font = [UIFont systemFontOfSize:15];
    tipLabel3.textColor = [UIColor lightGrayColor];
    
}

@end
