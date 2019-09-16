//
//  OrderDetailStep3NoExpressViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderDetailStep3NoExpressViewController.h"

@interface OrderDetailStep3NoExpressViewController ()

@end

@implementation OrderDetailStep3NoExpressViewController

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
    UIImageView *payMomentImageView = [[UIImageView alloc]init];
    [self.view addSubview:payMomentImageView];
    payMomentImageView.contentMode = UIViewContentModeScaleAspectFit;
    [payMomentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    payMomentImageView.image = [UIImage imageNamed:@"payMoment3"];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    [self.view addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(payMomentImageView.mas_bottom).offset(30);
        make.height.mas_equalTo(50);
        
    }];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.textColor = [UIColor orangeColor];
    priceLabel.font = [UIFont systemFontOfSize:30];
    priceLabel.text = @"¥199.90";
    
    UILabel *tipLabel = [[UILabel alloc]init];
    [self.view addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(priceLabel.mas_bottom).offset(5);
        
    }];
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.text = @"已付款";
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(tipLabel.mas_bottom).offset(40);
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *buyerLabel = [[UILabel alloc]init];
    [self.view addSubview:buyerLabel];
    [buyerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(lineView1.mas_bottom).offset(10);
    }];
    buyerLabel.text = [NSString stringWithFormat:@"刘刚     15868871815"];
    buyerLabel.font = [UIFont systemFontOfSize:15];
    
    UILabel *addressLabel = [[UILabel alloc]init];
    [self.view addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(buyerLabel.mas_bottom).offset(5);
    }];
    addressLabel.numberOfLines = 2;
    addressLabel.text = [NSString stringWithFormat:@"浙江省杭州市浙江省杭州市浙江省杭州市浙江省杭州市浙浙江省杭州市江省杭州市浙江省杭州市"];
    addressLabel.font = [UIFont systemFontOfSize:13];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(addressLabel.mas_bottom).offset(15);
    }];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *expressNumberLabel = [[UILabel alloc]init];
    [self.view addSubview:expressNumberLabel];
    [expressNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(kWindowWidth - 100);
        make.top.equalTo(lineView2.mas_bottom).offset(15);
    }];
    expressNumberLabel.text = @"同城交易, 无物流信息";
    expressNumberLabel.font = [UIFont systemFontOfSize:12];
    [expressNumberLabel setTextColor:[UIColor orangeColor]];
    
}


@end
