//
//  NewLoginRegisterViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewLoginRegisterViewController.h"

@interface NewLoginRegisterViewController ()
@property (strong, nonatomic) UIButton *button5;

@end

@implementation NewLoginRegisterViewController

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
    textfield1.placeholder = @"请输入手机号";
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
    textfield2.placeholder = @"请输入验证码";
   
    UIButton *makeCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:makeCodeButton];
    [makeCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.equalTo(view2.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(90, 30));
    }];
    [makeCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    makeCodeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [makeCodeButton setBackgroundColor: kPickColor];
    
    UIView *lineView2 = [[UIView alloc]init];
    [view2 addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView2.backgroundColor = [UIColor colorWithHex:@"#888888"];
    
    //------------------------------------view3----------------------------------
    
    UIView *view3 = [[UIView alloc]init];
    [imageView1 addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(view2.mas_bottom);
        make.height.mas_equalTo(55);
        
    }];
    UITextField *textfield3 = [[UITextField alloc]init];
    [view3 addSubview:textfield3];
    [textfield3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    textfield3.placeholder = @"请输入6-16位密码";
    UIView *lineView3 = [[UIView alloc]init];
    [view3 addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView3.backgroundColor = [UIColor colorWithHex:@"#888888"];
    
    
    //------------------------------------view4----------------------------------
    
    UIView *view4 = [[UIView alloc]init];
    [imageView1 addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(view3.mas_bottom);
        make.height.mas_equalTo(55);
        
    }];
    UITextField *textfield4 = [[UITextField alloc]init];
    [view4 addSubview:textfield4];
    [textfield4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    textfield4.placeholder = @"请再次输入密码";
    UIView *lineView4 = [[UIView alloc]init];
    [view4 addSubview:lineView4];
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView4.backgroundColor = [UIColor colorWithHex:@"#888888"];
    
    //------------------------------------view4----------------------------------
    
    UIView *view5 = [[UIView alloc]init];
    [imageView1 addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(view4.mas_bottom);
        make.height.mas_equalTo(55);
        
    }];
    
    self.button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view5 addSubview:self.button5];
    [self.button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(view5.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.button5 setImage:[UIImage imageNamed:@"loginNormal"] forState:UIControlStateNormal];
    [self.button5 setImage:[UIImage imageNamed:@"loginSelect"] forState:UIControlStateSelected];
    [self.button5 addTarget:self action:@selector(button5Action) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label5 = [[UILabel alloc]init];
    [view5 addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(view5.mas_centerY);
        make.left.equalTo(self.button5.mas_right).offset(20);
    }];
    label5.text = @"我已阅读并同意《漫饭用户协议》";
    label5.font = [UIFont systemFontOfSize:13];
    label5.textColor = [UIColor blackColor];
    
    UIButton *buttonLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    [view5 addSubview:buttonLabel];
    buttonLabel.frame = label5.bounds;
    [buttonLabel addTarget:self action:@selector(buttonLabelAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView1 addSubview:button6];
    [button6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.top.equalTo(view5.mas_bottom).offset(30);
        make.height.mas_equalTo(46);
    }];
    button6.layer.cornerRadius = 23;
    button6.layer.masksToBounds = YES;
    [button6 setBackgroundColor:kPickColor];
    [button6 setTitle:@"立即注册" forState:UIControlStateNormal];
    button6.titleLabel.font = [UIFont systemFontOfSize:15];
}

- (void)button5Action
{
    self.button5.selected = !self.button5.selected;
}

- (void)buttonLabelAction
{
    NSLog(@"用户协议");
}



@end
