//
//  OrderDetailStep3ViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "OrderDetailStep3ViewController.h"
//申请退款
#import "ReturnGoodsViewController.h"
@interface OrderDetailStep3ViewController ()

@end

@implementation OrderDetailStep3ViewController

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
    tipLabel.text = @"如您在7天内未点击确认收货,系统自动确认收货";
    
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
    expressNumberLabel.text = @"物流单号: 12345678901234";
    expressNumberLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *expressNameLabel = [[UILabel alloc]init];
    [self.view addSubview:expressNameLabel];
    [expressNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.width.mas_equalTo(100);
        make.top.equalTo(expressNumberLabel.mas_top).offset(0);
        
    }];
    expressNameLabel.text = @"顺丰物流";
    expressNameLabel.font = [UIFont systemFontOfSize:12];
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(.5);
        make.top.equalTo(expressNumberLabel.mas_bottom).offset(15);
    }];
    lineView3.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *deliverGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:deliverGoodsButton];
    [deliverGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(-(50+35));
    }];
    deliverGoodsButton.backgroundColor = [UIColor orangeColor];
    [deliverGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deliverGoodsButton setTitle:@"提醒发货" forState:UIControlStateNormal];
    [deliverGoodsButton addTarget:self action:@selector(deleiverButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *returnGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:returnGoodsButton];
    
    [returnGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(0);
    }];
    returnGoodsButton.backgroundColor = [UIColor lightGrayColor];
    [returnGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [returnGoodsButton setTitle:@"我要退货" forState:UIControlStateNormal];
    [returnGoodsButton addTarget:self action:@selector(returnButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:confirmGoodsButton];
    
    [confirmGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowWidth/2 - 17, 50));
        make.bottom.mas_equalTo(0);
    }];
    confirmGoodsButton.backgroundColor = [UIColor orangeColor];
    [confirmGoodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmGoodsButton setTitle:@"确认收货" forState:UIControlStateNormal];
    [confirmGoodsButton addTarget:self action:@selector(confirmButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark Aciton
- (void)deleiverButtonAction
{
    NSLog(@"提醒发货");
}

- (void)returnButtonAction
{
    NSLog(@"我要退货");
    ReturnGoodsViewController *vc = [[ReturnGoodsViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)confirmButtonAction
{
    NSLog(@"确定按钮");
    
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
