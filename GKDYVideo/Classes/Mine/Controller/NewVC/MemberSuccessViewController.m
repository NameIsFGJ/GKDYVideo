//
//  MemberSuccessViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MemberSuccessViewController.h"

@interface MemberSuccessViewController ()

@end

@implementation MemberSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
}

- (void)makeNav
{
    self.navigationItem.title  =@"预定成功";
}

- (void)makeUI
{
    
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(.3);
    }];
    lineView.backgroundColor = [UIColor lightGrayColor];
    
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(208);
    }];
    
    UIImageView *imageView0 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"paySuccess"]];
    [view0 addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view0.mas_centerX);
        make.top.equalTo(imageView0.mas_bottom).offset(5);
    }];
    label0.text = @"支付成功";
    label0.font = [UIFont systemFontOfSize:18];
    
    UILabel *label1 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(view0.mas_bottom);
    }];
    label1.text = @"交易编号";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:15];
    
    UILabel *label11 = [[UILabel alloc]init];
    [self.view addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.top.equalTo(label1.mas_top);
    }];
    label11.text = @"2019101111183912";
    label11.textColor = [UIColor lightGrayColor];
    label11.font = [UIFont systemFontOfSize:15];
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label1.mas_bottom).offset(10);
        make.height.mas_equalTo(.3);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(lineView1.mas_bottom).offset(10);
    }];
    label2.text = @"交易方式";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:15];
    
    UILabel *label22 = [[UILabel alloc]init];
    [self.view addSubview:label22];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.top.equalTo(label2.mas_top);
    }];
    label22.text = @"支付宝支付";
    label22.textColor = [UIColor lightGrayColor];
    label22.font = [UIFont systemFontOfSize:15];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label2.mas_bottom).offset(10);
        make.height.mas_equalTo(.3);
    }];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label3 = [[UILabel alloc]init];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.equalTo(lineView2.mas_bottom).offset(10);
    }];
    label3.text = @"交易时间";
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont systemFontOfSize:15];
    
    UILabel *label33 = [[UILabel alloc]init];
    [self.view addSubview:label33];
    [label33 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.top.equalTo(label3.mas_top);
    }];
    label33.text = @"2019.10.11";
    label33.textColor = [UIColor lightGrayColor];
    label33.font = [UIFont systemFontOfSize:15];
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label3.mas_bottom).offset(10);
        make.height.mas_equalTo(.3);
    }];
    lineView3.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(-88);
        make.height.mas_equalTo(50);
    }];
    [sureButton setTitle:@"完成" forState:UIControlStateNormal];
    [sureButton setTitleColor:kPickColor forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
    sureButton.layer.cornerRadius = 25;
    sureButton.layer.masksToBounds = YES;
    sureButton.layer.borderWidth = .5;
    sureButton.layer.borderColor = kPickColor.CGColor;
    [sureButton addTarget:self action:@selector(sureButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:checkButton];
    [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.bottom.equalTo(sureButton.mas_top).offset(-15);
        make.height.mas_equalTo(50);
    }];
    [checkButton setTitle:@"查看订单" forState:UIControlStateNormal];
    [checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [checkButton setBackgroundColor:kPickColor];
    checkButton.titleLabel.font = [UIFont systemFontOfSize:16];
    checkButton.layer.cornerRadius = 25;
    checkButton.layer.masksToBounds = YES;
   // checkButton.layer.borderWidth = .5;
   // checkButton.layer.borderColor = kPickColor.CGColor;
    
}

- (void)sureButtonAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
