//
//  NewLoginViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewLoginViewController.h"
#import "NewLoginRegisterViewController.h"

@interface NewLoginViewController ()

@end

@implementation NewLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView0 = [[UIImageView alloc]init];
    [self.view addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(292);
        make.top.mas_equalTo(0);
    }];
    imageView0.userInteractionEnabled = YES;
    imageView0.image = [UIImage imageNamed:@"loginImage4"];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginImage1"]];
    [self.view addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-15);
        make.top.mas_equalTo(160);
       // make.top.equalTo(imageView0.mas_height).multipliedBy(.55);
    }];
    imageView1.userInteractionEnabled = YES;
    UIImageView *imageView11 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginImage3"]];
    [imageView1 addSubview:imageView11];
    [imageView11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView1.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(130, 130));
        make.top.equalTo(imageView1.mas_top).offset(-65);
    }];
    
    UIImageView *imageView12 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginImage2"]];
    [imageView1 addSubview:imageView12];
    [imageView12 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.equalTo(imageView1.mas_centerX);
        make.top.equalTo(imageView11.mas_bottom).offset(0);
    }];
    
    //------------------------------------view1----------------------------------
    UIView *view1 = [[UIView alloc]init];
    [imageView1 addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(imageView0.mas_bottom);
        make.height.mas_equalTo(55);
        
    }];
    UITextField *textfield1 = [[UITextField alloc]init];
    [view1 addSubview:textfield1];
    [textfield1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    textfield1.placeholder = @"用户名/账号/手机号";
    UIView *lineView1 = [[UIView alloc]init];
    [view1 addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView1.backgroundColor = [UIColor colorWithHex:@"#888888"];
    
     //------------------------------------view2----------------------------------
    UIView *view2 = [[UIView alloc]init];
    [imageView1 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(view1.mas_bottom);
        make.height.mas_equalTo(55);
        
    }];
    
    UITextField *textfield2 = [[UITextField alloc]init];
    [view2 addSubview:textfield2];
    [textfield2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    textfield2.placeholder = @"请输入您的密码";
    UIView *lineView2 = [[UIView alloc]init];
    [view2 addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView2.backgroundColor = [UIColor colorWithHex:@"#888888"];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView1.mas_centerX);
        make.top.equalTo(view2.mas_bottom).offset(40);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
    }];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [loginButton setBackgroundColor:kPickColor];
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.masksToBounds = YES;
    [loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView1.mas_centerX).offset(-80);
        make.top.equalTo(loginButton.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    [registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [registerButton setTitleColor:[UIColor colorWithHex:@"#BABABA"] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:forgetButton];
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView1.mas_centerX).offset(80);
        make.top.equalTo(loginButton.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [forgetButton setTitleColor:[UIColor colorWithHex:@"#BABABA"] forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(forgetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label1 = [[UILabel alloc]init];
    [imageView1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView1.mas_centerX);
        make.top.equalTo(registerButton.mas_bottom).offset(40);
        
    }];
    label1.text = @"------- 第三方账号登录  -------";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:13];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(30);
        make.centerX.equalTo(imageView1.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    [button2 setImage:[UIImage imageNamed:@"loginQQ"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button2.mas_top).offset(0);
        make.centerX.equalTo(imageView1.mas_centerX).offset(-60);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    [button1 setImage:[UIImage imageNamed:@"loginWechat"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(button2.mas_top).offset(0);
        make.centerX.equalTo(imageView1.mas_centerX).offset(60);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    [button3 setImage:[UIImage imageNamed:@"loginWeiBo"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark Actions

- (void)loginButtonAction
{
    NSLog(@"登录按钮");
}

- (void)registerButtonAction
{
    NewLoginRegisterViewController *vc = [[NewLoginRegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
    
- (void)forgetButtonAction
{
    NSLog(@"忘记密码按钮");
}

- (void)button2Action
{
    NSLog(@"qq");
}

- (void)button1Action
{
    NSLog(@"wx");
}

- (void)button3Action
{
    NSLog(@"wb");
}

@end
