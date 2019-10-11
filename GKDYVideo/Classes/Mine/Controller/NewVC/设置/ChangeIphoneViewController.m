//
//  ChangeIphoneViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ChangeIphoneViewController.h"

@interface ChangeIphoneViewController ()

@end

@implementation ChangeIphoneViewController

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
    label.text = @"忘记密码";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    contentView.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1];
    
    //----------------------------view0------------------
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(contentView.mas_top).offset(8);
        make.height.mas_equalTo(55);
    }];
    view0.backgroundColor = [UIColor whiteColor];
    UILabel *label0 = [[UILabel alloc]init];
    [view0 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
        
    }];
    label0.text = @"当前密码:";
    label0.textAlignment = NSTextAlignmentCenter;
    label0.font = [UIFont systemFontOfSize:15];
    
    UITextField *textField0 = [[UITextField alloc]init];
    [view0 addSubview:textField0];
    [textField0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label0.mas_right);
        make.right.bottom.top.mas_equalTo(0);
    }];
    textField0.font = [UIFont systemFontOfSize:15];
    textField0.placeholder = @"请输入密码";
    textField0.keyboardType = UIKeyboardTypeNamePhonePad;
    
    //----------------------------view1------------------
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(2);
        make.height.mas_equalTo(55);
    }];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc]init];
    [view1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
        
    }];
    label1.text = @"输入手机号:";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:15];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:codeButton];
    [codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [codeButton setTitleColor:kPickColor forState:UIControlStateNormal];
    
    
    UITextField *textField1 = [[UITextField alloc]init];
    [view1 addSubview:textField1];
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label0.mas_right);
        make.bottom.top.mas_equalTo(0);
        make.right.equalTo(codeButton.mas_left);
        //make.width.mas_equalTo(200);
    }];
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.placeholder = @"请输入新手机号";
    textField1.keyboardType = UIKeyboardTypeNamePhonePad;
    
    //----------------------------view2------------------
    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(2);
        make.height.mas_equalTo(55);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    UILabel *label2 = [[UILabel alloc]init];
    [view2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
        
    }];
    label2.text = @"验证码:";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:15];
    
    UITextField *textField2 = [[UITextField alloc]init];
    [view2 addSubview:textField2];
    [textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right);
        make.right.bottom.top.mas_equalTo(0);
    }];
    textField2.font = [UIFont systemFontOfSize:15];
    textField2.placeholder = @"请输入验证码";
    textField2.keyboardType = UIKeyboardTypeNamePhonePad;
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(view2.mas_bottom).offset(25);
        make.height.mas_equalTo(50);
    }];
    submitButton.layer.cornerRadius = 25;
    submitButton.layer.masksToBounds = YES;
    [submitButton setTitle:@"确认修改" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton setBackgroundColor:kPickColor];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
}
@end
