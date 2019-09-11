//
//  MarketShopDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketShopDetailViewController.h"
#import "WebViewJavascriptBridge.h"
#import <WebKit/WebKit.h>
#import "MarketUserShopViewController.h"
#import "MarketOrderViewController.h"
#import "GoodsDetailNetworking.h"
@interface MarketShopDetailViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (strong, nonatomic)WKWebView *webView;
@property (strong, nonatomic)WebViewJavascriptBridge *bridge;

// 商铺
@property (assign, nonatomic)NSInteger userID;
@property (strong, nonatomic)NSString *head_url;
@property (strong, nonatomic)NSString *nickName;

// 订单页面
// 昵称
//@property (strong, nonatomic) NSString *nickName;
// 头像
@property (strong, nonatomic) NSString *head_pic;
// 商品图片
@property (strong, nonatomic) NSString *image_list;
// 商品名称
@property (strong, nonatomic) NSString *name;
// 售价
@property (strong, nonatomic) NSString *price;
// 库存
@property (assign, nonatomic) NSInteger count;
// 运费
@property (assign, nonatomic) NSInteger postMoney;

@end

@implementation MarketShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    [self makeUI];
    
    [self networking];
}

#pragma mark Actions

- (void)makeUI
{
//    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight)];
//    [self.view addSubview:_webView];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
//    NSString *htmlString = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//
//    [_webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
//
//    [self webBrige];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"立即购买" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getBuyButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    [[btn addTarget:self action:@selector(getBuyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)networking
{
    [GoodsDetailNetworking postGoodsDetailWithGoodsID:self.ide completion:^(NSDictionary * _Nonnull dic, NSError * _Nonnull error) {
       
        // 商铺
        self.userID =  (NSInteger)dic[@"user"][@"id"];
        self.nickName = dic[@"user"][@"nickname"];
        self.head_url = dic[@"user"][@"head_pic"];
        
        // 订单
        self.head_pic = dic[@"user"][@"head_pic"];
        
        NSArray *imageArray = dic[@"image_list"];
        if (imageArray.count <1) {
            self.image_list = @"";
        }else{
              self.image_list = [imageArray firstObject];
        }
        self.name = dic[@"name"];
        self.price = dic[@"price"];
        self.count = (NSInteger)dic[@"count"];
        self.postMoney = 7.00;
        
    }];
}

- (void)webBrige
{
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
    
    //    获取id  goodsID
    [self.bridge registerHandler:@"getGoodsIDAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(@(self.ide));
    }];
    
    //    返回    getBackViewAction
    [self.bridge registerHandler:@"getBackViewAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self backButtonAction];
    }];
    
    //   分享
    [self.bridge registerHandler:@"getBackViewAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self shareButtonAction];
    }];
    
    // 商铺
    [self.bridge registerHandler:@"getIconShopViewAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self getIconShopViewAction];
    }];
    
    // 私信
    [self.bridge registerHandler:@"getPrivateLetterAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self getPrivateLetterAction];
    }];
    
    // 立即购买
    [self.bridge registerHandler:@"getBuyButtonAction" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self getBuyButtonAction];
    }];
}

// 返回
- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 分享
- (void)shareButtonAction
{
    NSLog(@"点击分享按钮方法");
}

// 点击头像,进入卖家商铺
- (void)getIconShopViewAction
{
    MarketUserShopViewController *vc = [[MarketUserShopViewController alloc]init];
    vc.userID = self.userID;
    vc.head_url = self.head_url;
    vc.nickName = self.nickName;
}

// 私信
- (void)getPrivateLetterAction
{
    NSLog(@"点击私信");
}

// 立即购买
- (void)getBuyButtonAction
{
    NSLog(@"点击购买");
    MarketOrderViewController *vc = [[MarketOrderViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.nickName = self.nickName;
    vc.head_pic = self.head_pic;
    vc.image_list = self.image_list;
    vc.name = self.name;
    vc.price = self.price;
    vc.count = self.count;
    vc.postMoney = self.postMoney;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
