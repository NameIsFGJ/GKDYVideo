//
//  ReturnGoodsViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ReturnGoodsViewController.h"

@interface ReturnGoodsViewController ()

@end

@implementation ReturnGoodsViewController

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
    UIView *goodsInfoView = [[UIView alloc]init];
    [self.view addSubview:goodsInfoView];
    [goodsInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(KTopViewHeight);
        make.height.mas_equalTo(120);
    }];
    
    UIImageView *goodsImageView = [[UIImageView alloc]init];
    [goodsInfoView addSubview:goodsImageView];
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.equalTo(goodsInfoView.mas_top).offset(20);
    }];
    [goodsImageView setBackgroundColor:[UIColor orangeColor]];
    
    
    UILabel *goodsNameLabel = [[UILabel alloc]init];
    [goodsInfoView addSubview:goodsNameLabel];
    [goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsImageView.mas_right).offset(15);
        make.top.equalTo(goodsImageView.mas_top).offset(10);
    }];
    goodsNameLabel.text = @"奢华祖母绿钻戒";
    goodsNameLabel.font = [UIFont systemFontOfSize:15];
    
    UILabel *goodsPriceLabel = [[UILabel alloc]init];
    [goodsInfoView addSubview:goodsPriceLabel];
    [goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsNameLabel.mas_left).offset(0);
        make.top.equalTo(goodsNameLabel.mas_bottom).offset(15);
    }];
    goodsPriceLabel.text = [NSString stringWithFormat:@"¥ 1999.99"];
    goodsPriceLabel.font = [UIFont systemFontOfSize:15];
    goodsPriceLabel.textColor = [UIColor redColor];
    UILabel *goodsCountLabel = [[UILabel alloc]init];
    [goodsInfoView addSubview:goodsCountLabel];
    [goodsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(goodsPriceLabel.mas_right).offset(0);
        make.top.equalTo(goodsPriceLabel.mas_top).offset(0);
    }];
    goodsCountLabel.text = @"x 2";
    goodsCountLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *orderStatusLabel = [[UILabel alloc]init];
    [goodsInfoView addSubview:orderStatusLabel];
    [orderStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(goodsNameLabel.mas_left).offset(0);
        make.top.equalTo(goodsCountLabel.mas_bottom).offset(10);
    }];
    orderStatusLabel.text = @"交易关闭";
    orderStatusLabel.font = [UIFont systemFontOfSize:12];
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(goodsInfoView.mas_bottom).offset(0);
        make.height.mas_equalTo(10);
    }];
    lineView1.backgroundColor = [UIColor colorWithHex:@"#F0F1F5"];
    
    UIView *goodsReasonView = [[UIView alloc]init];
    [self.view addSubview:goodsReasonView];
    [goodsReasonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView1.mas_bottom).offset(0);
        make.height.mas_equalTo(326);
    }];
    
    UILabel *tipsLabel1 = [[UILabel alloc]init];
    [goodsReasonView addSubview:tipsLabel1];
    [tipsLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(goodsReasonView.mas_top).offset(0);
        make.height.mas_equalTo(60);
    }];
    tipsLabel1.font = [UIFont systemFontOfSize:15];
    tipsLabel1.text = @"退款原因:";
    
    UIButton *reasonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goodsReasonView addSubview:reasonButton];
    [reasonButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.size.mas_equalTo(CGSizeMake(90, 60));
        make.top.equalTo(goodsReasonView.mas_top).offset(0);
        make.centerX.equalTo(tipsLabel1.mas_centerX);
    }];
    [reasonButton setTitle:@"请选择" forState:UIControlStateNormal];
    reasonButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [reasonButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIView *lineView2 = [[UIView alloc]init];
    [goodsReasonView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(tipsLabel1.mas_bottom).offset(0);
        make.height.mas_equalTo(.3);
    }];
    lineView2.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *tipsLabel2 = [[UILabel alloc]init];
    [goodsReasonView addSubview:tipsLabel2];
    [tipsLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView2.mas_top).offset(0);
        make.height.mas_equalTo(50);
    }];
    tipsLabel2.font = [UIFont systemFontOfSize:15];
    tipsLabel2.text = @"退款金额:";
    
    UILabel *returnPriceLabel = [[UILabel alloc]init];
    [goodsReasonView addSubview:returnPriceLabel];
    [returnPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipsLabel2.mas_right).offset(5);
        make.height.mas_equalTo(50);
        make.top.equalTo(tipsLabel2.mas_top).offset(0);
    }];
    returnPriceLabel.font = [UIFont systemFontOfSize:15];
    [returnPriceLabel setTextColor:[UIColor redColor]];
    returnPriceLabel.text = @"¥ 100.00";
    
    UILabel *maxPriceLabel = [[UILabel alloc]init];
    [goodsReasonView addSubview:maxPriceLabel];
    [maxPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(returnPriceLabel.mas_right).offset(10);
        make.top.equalTo(tipsLabel2.mas_top).offset(0);
        make.height.mas_equalTo(50);
    }];
    maxPriceLabel.font = [UIFont systemFontOfSize:15];
    [maxPriceLabel setTextColor:[UIColor lightGrayColor]];
    maxPriceLabel.text = @"(最大¥999.99)";
    
    UIView *lineView3 = [[UIView alloc]init];
    [goodsReasonView addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(tipsLabel2.mas_bottom).offset(0);
        make.height.mas_equalTo(.3);
    }];
    lineView3.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *tipsLabel3 = [[UILabel alloc]init];
    [goodsReasonView addSubview:tipsLabel3];
    [tipsLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView3.mas_top).offset(0);
        make.height.mas_equalTo(50);
    }];
    tipsLabel3.font = [UIFont systemFontOfSize:15];
    tipsLabel3.text = @"退款说明:";
    
    UITextField *returnTextField = [[UITextField alloc]init];
    [goodsReasonView addSubview:returnTextField];
    [returnTextField mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(tipsLabel3.mas_right).offset(5);
      make.height.mas_equalTo(50);
      make.top.equalTo(tipsLabel3.mas_top).offset(0);
    }];
    returnTextField.placeholder = @"填写退款说明";
    
    UIView *lineView4 = [[UIView alloc]init];
    [goodsReasonView addSubview:lineView4];
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(tipsLabel3.mas_bottom).offset(0);
        make.height.mas_equalTo(.3);
    }];
    lineView4.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *tipsLabel4 = [[UILabel alloc]init];
    [goodsReasonView addSubview:tipsLabel4];
    [tipsLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView4.mas_top).offset(0);
        make.height.mas_equalTo(50);
    }];
    tipsLabel4.font = [UIFont systemFontOfSize:15];
    tipsLabel4.text = @"上传凭证:";
    
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    [submitButton setTitle:@"提交申请" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton setBackgroundColor:[UIColor orangeColor]];
    
}
@end
