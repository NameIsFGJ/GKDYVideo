//
//  DealSetViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "DealSetViewController.h"

@interface DealSetViewController ()

@end

@implementation DealSetViewController

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
    label.text = @"交易设置";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)makeUI
{
    
    UIView *lineView0 = [[UIView alloc]init];
    [self.view addSubview:lineView0];
    lineView0.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(10);
    }];
    
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView0.mas_bottom);
        make.height.mas_equalTo(55*3);
    }];
    UIView *view11 = [[UIView alloc]init];
    [view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(view1.mas_height).multipliedBy(.33);
    }];
    
    UILabel *label11 = [[UILabel alloc]init];
    [view11 addSubview:label11];
    label11.text = @"交易密码";
    label11.font = kFontSize(15);
    label11.textColor = [UIColor blackColor];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(.5);
        make.width.mas_equalTo(80);
    }];
    
    UIImageView *pushImageView11 = [[UIImageView alloc]init];
    [view11 addSubview:pushImageView11];
    pushImageView11.image = [UIImage imageNamed:@"pushImage"];
    [pushImageView11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6, 11));
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-12);
    }];
    
    UIView *lineView11 = [[UIView alloc]init];
    [view11 addSubview:lineView11];
    lineView11.backgroundColor = [UIColor lightGrayColor];
    [lineView11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-.5);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(.5);
    }];
    UIView *view12 = [[UIView alloc]init];
    [view1 addSubview:view12];

    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view11.mas_bottom).offset(0);
        make.height.equalTo(view1.mas_height).multipliedBy(.33);
    }];
    
    UILabel *label12 = [[UILabel alloc]init];
    [view12 addSubview:label12];
    label12.text = @"忘记密码";
    label12.font = kFontSize(15);
    label12.textColor = [UIColor blackColor];
    [label12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(.5);
        make.width.mas_equalTo(80);
    }];

    UIImageView *pushImageView12 = [[UIImageView alloc]init];
    [view12 addSubview:pushImageView12];
    pushImageView12.image = [UIImage imageNamed:@"pushImage"];
    [pushImageView12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6, 11));
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-12);
    }];
    
    UIView *lineView12 = [[UIView alloc]init];
    [view12 addSubview:lineView12];
    lineView12.backgroundColor = [UIColor lightGrayColor];
    [lineView12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-.1);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(.1);
    }];
    
    UIView *view13 = [[UIView alloc]init];
    [view1 addSubview:view13];
   
    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view12.mas_bottom).offset(0);
        make.height.equalTo(view1.mas_height).multipliedBy(.33);
    }];
    
    
    UILabel *label13 = [[UILabel alloc]init];
    [view13 addSubview:label13];
    label13.text = @"提现账号";
    label13.font = kFontSize(15);
    label13.textColor = [UIColor blackColor];
    [label13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(.5);
        make.width.mas_equalTo(80);
    }];
    
    UIImageView *pushImageView13 = [[UIImageView alloc]init];
    [view13 addSubview:pushImageView13];
    pushImageView13.image = [UIImage imageNamed:@"pushImage"];
    [pushImageView13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6, 11));
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-12);
    }];
    UITextField *textField13 = [[UITextField alloc]init];
    [view13 addSubview:textField13];
    textField13.font = kFontSize(15);
    [textField13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(pushImageView13.mas_left).offset(-10);
        make.centerY.mas_equalTo(0);
        
    }];
    textField13.placeholder = @"填写您要提现的支付宝账号";
    UIView *lineView13 = [[UIView alloc]init];
    [view13 addSubview:lineView13];
    lineView13.backgroundColor = [UIColor lightGrayColor];
    [lineView13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-.1);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(.1);
    }];
    
}
- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
