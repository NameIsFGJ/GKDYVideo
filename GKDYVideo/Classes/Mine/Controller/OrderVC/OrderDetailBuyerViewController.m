//
//  OrderDetailBuyerViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderDetailBuyerViewController.h"
#import "OrderDetilNetworking.h"
#import "OrderDetailModel.h"
//  退货
#import "ReturnGoodsViewController.h"

@interface OrderDetailBuyerViewController ()
@property (strong, nonatomic) OrderDetailModel *model;

@property (strong, nonatomic) UIImageView *payMomentImageView;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *tipLabel;
@property (strong, nonatomic) UILabel *buyerLabel;
@property (strong, nonatomic) UIView *lineView1;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIView *lineView2;
@property (strong, nonatomic) UILabel *expressNumberLabel;
@property (strong, nonatomic) UILabel *expressNameLabel;
@property (strong, nonatomic) UIView *lineView3;
@property (strong, nonatomic) UIButton *warnGoodsButton;
@property (strong, nonatomic) UIButton *returnGoodsButton;
@property (strong, nonatomic) UIButton *confirmGoodsButton;
@end

@implementation OrderDetailBuyerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
    [self networking];
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"订单详情";
    label.textColor = [UIColor blackColor];
    self.navigationItem.titleView = label;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"blackBack"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    self.payMomentImageView = [[UIImageView alloc]init];
    [self.view addSubview:self.payMomentImageView];
    self.payMomentImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.payMomentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    self.payMomentImageView.image = [UIImage imageNamed:@"payMoment3"];
    
    self.priceLabel = [[UILabel alloc]init];
    [self.view addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.payMomentImageView.mas_bottom).offset(30);
        make.height.mas_equalTo(50);
        
    }];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textColor = [UIColor orangeColor];
    self.priceLabel.font = [UIFont systemFontOfSize:30];
    self.priceLabel.text = @"¥199.90";
    
    self.tipLabel = [[UILabel alloc]init];
    [self.view addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(5);
        
    }];
    
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.textColor = [UIColor lightGrayColor];
    self.tipLabel.font = [UIFont systemFontOfSize:15];
    self.tipLabel.text = @"如您在7天内未点击确认收货,系统自动确认收货";
    
    self.lineView1 = [[UIView alloc]init];
    [self.view addSubview:self.lineView1];
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.tipLabel.mas_bottom).offset(40);
    }];
    self.lineView1.backgroundColor = [UIColor lightGrayColor];
    
    self.buyerLabel = [[UILabel alloc]init];
    [self.view addSubview:self.buyerLabel];
    [self.buyerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(self.lineView1.mas_bottom).offset(10);
    }];
    self.buyerLabel.text = [NSString stringWithFormat:@"刘刚     15868871815"];
    self.buyerLabel.font = [UIFont systemFontOfSize:15];
    
    self.addressLabel = [[UILabel alloc]init];
    [self.view addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(self.buyerLabel.mas_bottom).offset(5);
    }];
    self.addressLabel.numberOfLines = 2;
    self.addressLabel.text = [NSString stringWithFormat:@"浙江省杭州市浙江省杭州市浙江省杭州市浙江省杭州市浙浙江省杭州市江省杭州市浙江省杭州市"];
    self.addressLabel.font = [UIFont systemFontOfSize:13];
    
    self.lineView2 = [[UIView alloc]init];
    [self.view addSubview:self.lineView2];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.addressLabel.mas_bottom).offset(15);
    }];
    self.lineView2.backgroundColor = [UIColor lightGrayColor];
    
    self.expressNumberLabel = [[UILabel alloc]init];
    [self.view addSubview:self.expressNumberLabel];
    [self.expressNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(kWindowWidth - 100);
        make.top.equalTo(self.lineView2.mas_bottom).offset(15);
    }];
    self.expressNumberLabel.text = @"物流单号: 12345678901234";
    self.expressNumberLabel.font = [UIFont systemFontOfSize:12];
    
    self.expressNameLabel = [[UILabel alloc]init];
    [self.view addSubview:self.expressNameLabel];
    [self.expressNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.width.mas_equalTo(100);
        make.top.equalTo(self.expressNumberLabel.mas_top).offset(0);
        
    }];
    self.expressNameLabel.text = @"顺丰物流";
    self.expressNameLabel.font = [UIFont systemFontOfSize:12];
    
    self.lineView3 = [[UIView alloc]init];
    [self.view addSubview:self.lineView3];
    [self.lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(self.expressNumberLabel.mas_bottom).offset(15);
    }];
    self.lineView3.backgroundColor = [UIColor lightGrayColor];
    
    self.warnGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.warnGoodsButton];
    [self.warnGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(-(50+35));
    }];
    self.warnGoodsButton.backgroundColor = [UIColor orangeColor];
    [self.warnGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.warnGoodsButton setTitle:@"提醒发货" forState:UIControlStateNormal];
    [self.warnGoodsButton addTarget:self action:@selector(warnGoodsButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.returnGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.returnGoodsButton];
    
    [self.returnGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(0);
    }];
    self.returnGoodsButton.backgroundColor = [UIColor lightGrayColor];
    [self.returnGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.returnGoodsButton setTitle:@"我要退货" forState:UIControlStateNormal];
    [self.returnGoodsButton addTarget:self action:@selector(returnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.confirmGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.confirmGoodsButton];
    
    [self.confirmGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(0);
    }];
    
    self.confirmGoodsButton.backgroundColor = [UIColor orangeColor];
    [self.confirmGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.confirmGoodsButton setTitle:@"确认收货" forState:UIControlStateNormal];
    [self.confirmGoodsButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)networking
{
    [OrderDetilNetworking postOrderDetailNetworkingWithToken:kUser.user_token withType:1 withOrderID:self.orderID completion:^(NSMutableArray * _Nonnull array, NSError * _Nonnull error) {
        NSLog(@"array34  =%@",array);
        
        self.model = [array firstObject];
        
        // 1.不用变的
        self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",self.model.orderAmount];
        self.buyerLabel.text = [NSString stringWithFormat:@"%@      %@",self.model.consignee,self.model.mobile];
        self.addressLabel.text = self.model.address;
        // 2.需要变的
        
        // 未支付的状态
        if (self.model.payStatus == 0 && self.model.shipStatus == 0)
        {
            self.payMomentImageView.image = [UIImage imageNamed:@"payMoment1"];
            self.tipLabel.text = @"您还未付款,请尽快付款以便卖家发货";
            self.expressNameLabel.hidden = YES;
            self.expressNumberLabel.hidden = YES;
            self.lineView3.hidden = YES;
            self.warnGoodsButton.hidden = YES;
            self.returnGoodsButton.hidden = YES;
            [self.confirmGoodsButton setTitle:@"去付款" forState:UIControlStateNormal];
            [self.confirmGoodsButton addTarget:self
                                        action:@selector(payButtonAction) forControlEvents:UIControlEventTouchUpInside];
        }
        
        //  已付款 + 未发货
        if (self.model.payStatus == 1 && self.model.shipStatus == 1) {
            self.payMomentImageView.image = [UIImage imageNamed:@"payMoment2"];
            self.tipLabel.text = @"钱款已付";
            self.expressNameLabel.hidden = YES;
            self.expressNumberLabel.hidden = YES;
            self.lineView3.hidden = YES;
            self.warnGoodsButton.hidden = YES;
            self.returnGoodsButton.hidden = NO;
            [self.confirmGoodsButton setTitle:@"提醒发货" forState:UIControlStateNormal];
            [self.confirmGoodsButton addTarget:self action:@selector(warnGoodsButtonAction) forControlEvents:UIControlEventTouchUpInside];
            [self.confirmGoodsButton setBackgroundColor:[UIColor orangeColor]];
        }
        
        //  已付款 + 已发货
        if (self.model.payStatus == 1 && self.model.shipStatus == 2 ) {
            self.payMomentImageView.image = [UIImage imageNamed:@"payMoment3"];
            self.tipLabel.text = @"如您在7日未点击确认收货,系统自动确认收货";
            self.expressNumberLabel.hidden = NO;
            self.expressNameLabel.hidden = NO;
            self.lineView3.hidden = NO;
            self.expressNumberLabel.text = self.model.ship_code;
            self.expressNumberLabel.text = self.model.ship_name;
            self.warnGoodsButton.hidden = YES;
            self.returnGoodsButton.hidden = NO;
            [self.confirmGoodsButton setTitle:@"确认收货" forState:UIControlStateNormal];
            [self.confirmGoodsButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchUpInside];
            [self.confirmGoodsButton setBackgroundColor:[UIColor orangeColor]];
        }
        
        // 已付款 + 已收货
        if (self.model.payStatus == 1 && self.model.shipStatus == 3) {
            self.payMomentImageView.image = [UIImage imageNamed:@"payMoment4"];
            self.tipLabel.text = @"钱款已收";
            self.expressNumberLabel.hidden = NO;
            self.expressNameLabel.hidden = NO;
            self.lineView3.hidden = NO;
            self.expressNumberLabel.text = self.model.ship_code;
            self.expressNumberLabel.text = self.model.ship_name;
            self.warnGoodsButton.hidden = YES;
            self.returnGoodsButton.hidden = NO;
            [self.confirmGoodsButton setTitle:@"交易完成" forState:UIControlStateNormal];
            [self.confirmGoodsButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchUpInside];
            [self.confirmGoodsButton setBackgroundColor:[UIColor lightGrayColor]];
        }
    }];
}

#pragma mark Aciton
- (void)warnGoodsButtonAction
{
    NSLog(@"提醒发货");
}

- (void)returnButtonAction
{
    NSLog(@"我要退货");
//    ReturnGoodsViewController *vc = [[ReturnGoodsViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)confirmButtonAction
{
    NSLog(@"确定按钮");
    
}

- (void)payButtonAction
{
    NSLog(@"去付款");
}

- (void)orderEndButonAction
{
    NSLog(@"交易完成");
}




@end
