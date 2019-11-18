//
//  MemberBredgeViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MemberBredgeViewController.h"
#import "MemberPayViewController.h"
@interface MemberBredgeViewController ()

@end

@implementation MemberBredgeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self makeUI];
}

- (void)makeUI
{
        UIView *lineView1 = [[UIView alloc]init];
        [self.view addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(KTopViewHeight);
            make.height.mas_equalTo(.3);
        }];
        lineView1.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"memberBredgeImage2"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(150);
        make.top.mas_equalTo(-20);
    }];
    imageView.userInteractionEnabled = YES;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(KStatusBarHeight+15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [leftButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [imageView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        make.top.equalTo(leftButton);
    }];
    titleLabel.text = @"开通会员";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"memberBredgeImage3"]];
    [imageView addSubview:headImageView];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(42);
        make.bottom.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UILabel *headLabel = [[UILabel alloc]init];
    [imageView addSubview:headLabel];
    [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headImageView.mas_centerY);
        make.left.equalTo(headImageView.mas_right).offset(10);
    }];
    headLabel.text = @"漫饭245";
    headLabel.textColor = [UIColor whiteColor];
    headLabel.font = [UIFont systemFontOfSize:15];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"memberBredgeImage1"]];
    [self.view addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(imageView.mas_bottom).offset(40);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(85);
    }];
    imageView1.userInteractionEnabled = YES;
    
    UILabel *label1 = [[UILabel alloc]init];
    [imageView1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(41);
        make.top.equalTo(imageView1.mas_top);
        make.height.equalTo(imageView1.mas_height).multipliedBy(.5);
    }];
    label1.text = @"月卡";
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor blackColor];
    
    UILabel *label2 = [[UILabel alloc]init];
    [imageView1 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(41);
        make.top.equalTo(label1.mas_bottom);
        make.height.equalTo(imageView1.mas_height).multipliedBy(.5);
    }];
    label2.text = @"每月享受专属会员";
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor blackColor];
    
    
    UILabel *label3 = [[UILabel alloc]init];
    [imageView1 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY);
        make.right.mas_equalTo(-52);
        //make.left.mas_equalTo(12);
      //  make.top.equalTo(label1.mas_bottom);
       /// make.height.equalTo(imageView1.mas_height).multipliedBy(.5);
    }];
    label3.text = @"¥8";
    label3.font = [UIFont systemFontOfSize:24];
    label3.textColor = [UIColor blackColor];
    
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-34);
        make.height.mas_equalTo(53);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"payLeftImage1"]];
    [view1 addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.equalTo(view1.mas_width).multipliedBy(.7);
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    [view1 addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.equalTo(view1.mas_width).multipliedBy(.7);
    }];
    
    label4.text = @"月卡 ¥8";
    label4.textColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(view1.mas_width).multipliedBy(.3);
    }];
    [button setTitle:@"去支付" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"payImage1"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buttonAction
{
    MemberPayViewController *vc = [[MemberPayViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
