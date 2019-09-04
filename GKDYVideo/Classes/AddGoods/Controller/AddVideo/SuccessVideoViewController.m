//
//  SuccessVideoViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SuccessVideoViewController.h"
@interface SuccessVideoViewController ()

@end

@implementation SuccessVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    label.text = @"发布成功";
    label.textColor = [UIColor blackColor];
    //label.font = [UIFont systemFontOfSize:24];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(23);
        make.top.mas_equalTo(110);
        make.centerX.equalTo(self.view);
    }];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:24];
    
    UILabel *label1 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(38);
        make.top.equalTo(label.mas_bottom).offset(35);
        make.height.mas_equalTo(12);
    }];
    label1.text = @"分享到以下平台,让更多人知道";
    label1.font = [UIFont systemFontOfSize:12];
    
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.left.right.mas_equalTo(0);
       // make.top.mas_equalTo(100);
        make.top.equalTo(label1.mas_bottom).offset(17);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth- 38*2, 80));
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    contentView.backgroundColor = [UIColor whiteColor];
    NSArray *titleArrray = [NSArray arrayWithObjects:@"微信好友",@"朋友圈",@"QQ好友", nil];
    NSArray *imageArray = [NSArray arrayWithObjects:@"chat_icon",@"circle_icon",@"qq_ico", nil];
    
    NSInteger btnWidth = (kWindowWidth -38*2-78)/3;
    
    for (int i = 0; i < 3 ; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(btnWidth, 80));
            make.left.mas_equalTo(i * 140);
           
        }];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *imageView = [[UIImageView alloc]init];
        [btn addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(48, 48));
        }];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        UILabel *label = [[UILabel alloc]init];
        [btn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).offset(10);
            make.left.mas_equalTo(0);
        }];
        
        label.text = titleArrray[i];
        label.font = kFontSize(14);
        label.textColor = [UIColor blackColor];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.bottom.mas_equalTo(-60);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [btn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)shareButtonAction:(UIButton *)btn
{
    NSLog(@"btn 34.tag =%ld",btn.tag);
}

- (void)closeButtonAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
