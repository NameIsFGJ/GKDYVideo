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
@interface ToPayView()

@property (strong, nonatomic)NSDictionary *payDic;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toPayNetworking) name:@"AliPaySuccess" object:nil];
    
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
    [aliButton addTarget:self action:@selector(toPayNetworking) forControlEvents:UIControlEventTouchUpInside];
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

- (void)aliPayButtonAction2
{
   
}


// 支付宝配置
- (void)alipayButtonAction
{
    NSString *appID = [NSString stringWithFormat:@"%@",self.payDic[@"app_id"]];
    //appID = @"2019042364254490";
    NSString *rsa2PrivateKey = self.payDic[@"private_key"];
    NSString *rsaPrivateKey = @"";
    //将商品信息赋予AlixPayOrder的成员变量
    APOrderInfo* order = [APOrderInfo new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type 根据商户设置的私钥来决定
    order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [APBizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"1";
    order.biz_content.out_trade_no = [NSString stringWithFormat:@"%ld",self.orderSn]; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", self.orderAmount]; //商品价格
    order.notify_url = @"https://mftest.zjchuanwen.com/api/order/notifyx/type/alipay";
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    NSString *signedString = nil;
    APRSASigner* signer = [[APRSASigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
    if ((rsa2PrivateKey.length > 1)) {
        signedString = [signer signString:orderInfo withRSA2:YES];
    } else {
        signedString = [signer signString:orderInfo withRSA2:NO];
    }
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"aliPayScheme";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        // NOTE: 调用支付结果开始支付
        //  (没有安装支付宝的情况下)网页支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            
            if ([resultDic[@"resultStatus"]integerValue] == 9000) {
            
                [[NSNotificationCenter defaultCenter] postNotificationName:@"AliPaySuccess" object:nil];
                
            }
        }];
    }
}

// 微信配置
- (void)wechatButtonAction
{
    
}

- (void)paySuccessAction
{
    OrderDetailBuyerViewController *vc = [[OrderDetailBuyerViewController alloc]init];
    vc.orderSn = self.orderSn;
    vc.hidesBottomBarWhenPushed = YES;
    [self.viewContainingController.navigationController pushViewController:vc animated:YES];
}

- (void)networking
{
    self.payDic = [NSDictionary dictionary];
    
    [ToPayNetworking postToPayWithToken:kUser.user_token completion:^(NSDictionary * _Nonnull dic, NSError * _Nonnull eror) {
        self.payDic = dic;
    }];
}

// 调用 自己的接口    接收消息后进行处理的方法
- (void)toPayNetworking
{
    [ToPaySuccessNetworking PostToPaySuccessNetworkingWithToken:kUser.user_token withOrderAmount:[NSString stringWithFormat:@"%.2f",self.orderAmount] withOrderSn:[NSString stringWithFormat:@"%ld",self.orderSn] withPayType:@"alipay" completion:^(NSString * _Nonnull data, NSError * _Nonnull error) {
        NSLog(@"d34ata  =%@",data);
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

@end
