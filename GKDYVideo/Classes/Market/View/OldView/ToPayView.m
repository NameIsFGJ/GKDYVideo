//
//  ToPayView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ToPayView.h"
#import "ToPayNetworking.h"
#import "APOrderInfo.h"
#import "APRSASigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "OrderDetailBuyerViewController.h"
#import "ToPaySuccessNetworking.h"
#import "ToPayDataNetworking.h"
#import <WebKit/WebKit.h>
@interface ToPayView()

@property (strong, nonatomic) NSDictionary *payDic;
@property (strong, nonatomic) WKWebView *webView;
@end

@implementation ToPayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];

    self.backgroundColor = [UIColor whiteColor];
    
    [self networking];
    [self makeUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paySuccessAction) name:@"AliPaySuccess" object:nil];
    
    return self;
}

- (void)makeUI
{
    UIView *blackView = [[UIView alloc]init];
    [self addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowHeight - 330);
    }];
    blackView.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(missView)];
    [blackView addGestureRecognizer:tap];
    
    UIView *contentView = [[UIView alloc]init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(300);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(0);
    }];
    label.text = @"请选择支付方式";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    
    UIButton *aliButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:aliButton];
    aliButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    aliButton.layer.borderWidth = .5;
    aliButton.layer.cornerRadius = 5;
    aliButton.layer.masksToBounds = YES;
    [aliButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [aliButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.top.equalTo(label.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [aliButton setImage:[UIImage imageNamed:@"zhifubao"] forState:UIControlStateNormal];
    [aliButton setTitle:@"支付宝" forState:UIControlStateNormal];
    [aliButton addTarget:self action:@selector(alipayButtonAction) forControlEvents:UIControlEventTouchUpInside];
    aliButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [aliButton layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleBottom imageTitleSpace:3];
    UIButton *wechatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:wechatButton];
    [wechatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-60);
        make.top.equalTo(label.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [wechatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [wechatButton setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [wechatButton setTitle:@"微信" forState:UIControlStateNormal];
    wechatButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [wechatButton layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleBottom imageTitleSpace:3];
    wechatButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    wechatButton.layer.borderWidth = .5;
    wechatButton.layer.cornerRadius = 5;
    wechatButton.layer.masksToBounds = YES;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [cancelButton setBackgroundColor:[UIColor orangeColor]];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(missView) forControlEvents:UIControlEventTouchUpInside];
    
}

// 支付宝配置
- (void)alipayButtonAction
{
    @weakify(self)
    [ToPaySuccessNetworking PostToPaySuccessNetworkingWithToken:kUser.user_token withOrderAmount:[NSString stringWithFormat:@"%.2f",self.orderAmount] withOrderSn:[NSString stringWithFormat:@"%ld",self.orderSn] withPayType:@"alipay" completion:^(NSString * _Nonnull data, NSError * _Nonnull error) {
        if (data.length > 1) {
            
            [[AlipaySDK defaultService] payOrder:data fromScheme:@"aliPayScheme" callback:^(NSDictionary *resultDic) {
                
                if ([resultDic[@"resultStatus"] integerValue] == 9000)
                {
                    @strongify(self)
                    [self showSuccessMsg:@"支付成功"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"AliPaySuccess" object:nil];
                }
                else if ([resultDic[@"resultStatus"] integerValue] == 6001)
                {
                    [self showErrorMsg:@"取消支付"];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"AliPaySuccess" object:nil];
                }
                else if ([resultDic[@"resultStatus"] integerValue] == 6002)
                {
                    [self showErrorMsg:@"网络连接错误"];
                }
                else if ([resultDic[@"resultStatus"] integerValue] == 4000)
                {
                    [self showErrorMsg:@"订单支付失败"];
                }
            }];
        }
    }];
}

// 微信配置
- (void)wechatButtonAction
{
    
}

- (void)paySuccessAction
{
    OrderDetailBuyerViewController *vc = [[OrderDetailBuyerViewController alloc]init];
    vc.orderID = self.orderSn;
    [self.viewContainingController.navigationController pushViewController:vc animated:YES];
}

- (void)networking
{
    self.payDic = [NSDictionary dictionary];
    
    [ToPayNetworking postToPayWithToken:kUser.user_token completion:^(NSDictionary * _Nonnull dic, NSError * _Nonnull eror) {
        self.payDic = dic;
    }];
}

#pragma mark  取消视图
- (void)missView
{
    [UIView animateWithDuration:.5 animations:^{
        [self removeFromSuperview];
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AliPaySuccess" object:nil];
}

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
    }
    return _webView;
}
@end
