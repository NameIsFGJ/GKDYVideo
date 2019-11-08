//
//  AddGoodsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/31.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsViewController.h"
#import "AddGoodsChildViewController.h"
#import "AddGoodsSuccessViewController.h"
#import "AddVideoViewController.h"
#import "EditViewController.h"
#import "UploadViewController.h"
@interface AddGoodsViewController ()

@end

@implementation AddGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"发布";
    
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -40));
        make.size.mas_equalTo(CGSizeMake(kWindowWidth, 97));
    }];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn1];
    [btn1 setImage:[UIImage imageNamed:@"pushGoods"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pushGoodsAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn2];
    [btn2 setImage:[UIImage imageNamed:@"pushVideo"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(pushVideoAction) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *btnArray = [NSArray arrayWithObjects:btn1,btn2, nil];
    
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:50 tailSpacing:50];
    
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}


- (BOOL)setupTarbarHidden
{
    return NO;
}
#pragma mark Action
- (void)pushGoodsAction
{
    AddGoodsChildViewController *vc = [[AddGoodsChildViewController alloc]init];
   [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushVideoAction
{
    UploadViewController *vc = [[UploadViewController alloc]init];
   [self.navigationController pushViewController:vc animated:YES];
}

@end
