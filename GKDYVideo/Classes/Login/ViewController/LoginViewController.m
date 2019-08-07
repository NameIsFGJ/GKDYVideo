//
//  LoginViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/23.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "LoginViewController.h"
#import "SendRegisterCodeNetworking.h"
#import "LoginNetworking.h"
#import "AppDelegate.h"
#import <JKCountDownButton.h>
@interface LoginViewController ()
@property (strong, nonatomic) UITextField *numberTextField;
@property (strong, nonatomic) UITextField *importCode;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger countDownTime;
@property (strong, nonatomic) JKCountDownButton *codeButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.countDownTime = 60;
    self.view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginBackgroud"]];
    self.view.userInteractionEnabled = YES;
    [self creatUI];
}

- (void)creatUI
{
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:closeButton];
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [closeButton addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"closeLoginVC"]];
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.center.equalTo(closeButton);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeButtonAction)];
    [imageView addGestureRecognizer:tap];
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.view addSubview:titleLabel];
    titleLabel.text = @"手机登录更快捷";
    titleLabel.font = [UIFont systemFontOfSize:18];
    [titleLabel setTextColor:[UIColor lightTextColor]];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -150));
    }];
    
    UIView *view1 = [[UIView alloc]init];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
         make.center.equalTo(self.view).centerOffset(CGPointMake(0, -90));
    }];
    view1.backgroundColor = [UIColor colorWithHex:@"#F1F1F4" alpha:.1];
    view1.layer.cornerRadius = 5;
    view1.layer.masksToBounds = YES;
    
    UIView *view2 = [[UIView alloc]init];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, -30));
    }];
    view2.layer.cornerRadius = 5;
    view2.layer.masksToBounds = YES;
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    submitButton.layer.cornerRadius = 5;
    submitButton.layer.masksToBounds = YES;
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.center.equalTo(self.view).centerOffset(CGPointMake(0, 40));
    }];
    
    submitButton.backgroundColor = [UIColor colorWithHex:@"#FEA93B"];
    [submitButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [submitButton setTitle:@"确定" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *numberLabel = [[UILabel alloc]init];
    [view1 addSubview:numberLabel];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(view1.mas_height).offset(0);
        make.width.mas_equalTo(50);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
    }];
    numberLabel.text = @"+86";
    [numberLabel setTextColor:kWhiteColor];
    
    self.numberTextField = [[UITextField alloc]init];
    [view1 addSubview:self.numberTextField];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.left.equalTo(numberLabel.mas_right).offset(10);
        make.bottom.mas_equalTo(0);
    }];
    self.numberTextField.placeholder = @"输入手机号码";
    [self.numberTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.numberTextField.textColor = [UIColor whiteColor];
    self.importCode = [[UITextField alloc]init];
    [view2 addSubview:self.importCode];
    [self.importCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(view1.mas_width).multipliedBy(.63);
        make.left.top.bottom.mas_equalTo(0);
    }];
    self.importCode.placeholder = @"输入短信验证码";
    [self.importCode setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    self.importCode.layer.cornerRadius = 5;
    self.importCode.layer.masksToBounds = YES;
    self.importCode.backgroundColor = [UIColor colorWithHex:@"#F1F1F4" alpha:.1];
    self.importCode.textColor = [UIColor whiteColor];
    self.codeButton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:self.codeButton];
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(0);
        make.left.equalTo(self.importCode.mas_right).offset(5);
    }];
    [self.codeButton setTitle:@"短信验证" forState:UIControlStateNormal];
    [self.codeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.codeButton.layer.cornerRadius = 5;
    self.codeButton.layer.masksToBounds = YES;
    [self.codeButton setBackgroundColor:[UIColor colorWithHex:@"#F1F1F4" alpha:.1]];
    [self.codeButton addTarget:self action:@selector(codeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.codeButton countDownButtonHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
        countDownButton.enabled = NO;
        [countDownButton startCountDownWithSecond:60];
        [countDownButton countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%ld秒",second];
            return title;
        }];
        [countDownButton countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"重新获取";
        }];
    }];
}

#pragma mark Actions

// 关闭登录
- (void)closeButtonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 接收验证码
- (void)codeButtonAction
{
    [SendRegisterCodeNetworking postSendRegisterCode:self.numberTextField.text withScene:@"mobilelogin" completion:^(BaseModel * _Nonnull model, NSError * _Nonnull error) {
        switch (model.code) {
                            case 1:
                                [self showSuccessMsg:@"发送成功"];
                                break;
                            case 600:
                                [self showErrorMsg:@"验证码不正确"];
                                break;
                            case 610:
                                [self showErrorMsg:@"验证码已失效"];
                                break;
                            default:
                                break;
                        }
    }];
}

// 确定按钮
- (void)submitButtonAction
{
    [LoginNetworking postLogin:self.numberTextField.text codeNumber:self.importCode.text completionHandle:^(DataModel * _Nonnull model, NSError * _Nonnull error) {
        
       
           // Data *data = model.data;
            kUser.user_token = model.token;
            kUser.user_id = model.user_id;
            kUser.nickname = model.nickname;
      
            [[(AppDelegate *)[UIApplication sharedApplication].delegate main] setSelectedIndex:kTabBar_Index_mine];
            [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
