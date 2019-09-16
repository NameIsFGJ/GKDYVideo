//
//  ReturnGoodsDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ReturnGoodsDetailViewController.h"

@interface ReturnGoodsDetailViewController ()

@end

@implementation ReturnGoodsDetailViewController

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
    UIView *returnTimeView = [[UIView alloc]init];
    [self.view addSubview:returnTimeView];
    [returnTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(85);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    returnTimeView.backgroundColor = [UIColor redColor];
    
    UILabel *tipLabel1 = [[UILabel alloc]init];
    [returnTimeView addSubview:tipLabel1];
    [tipLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(returnTimeView.mas_top).offset(0);
        make.height.equalTo(returnTimeView.mas_height).multipliedBy(1);
    }];
    tipLabel1.textAlignment = NSTextAlignmentCenter;
    tipLabel1.textColor = [UIColor whiteColor];
    tipLabel1.text = @"请等待卖家处理 \n还剩7天21时05分";
    tipLabel1.font = [UIFont systemFontOfSize:15];
    tipLabel1.numberOfLines = 0;
    
    UILabel *tipLabel2 = [[UILabel alloc]init];
    [self.view addSubview:tipLabel2];
    [tipLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(returnTimeView.mas_bottom).offset(0);
        make.height.mas_equalTo(53);
    }];
    tipLabel2.textAlignment = NSTextAlignmentCenter;
    tipLabel2.text = @"您已成功发起退款申请,清耐心等待卖家处理.";
    
    UIView *lineView1 = [[UIView alloc]init];
    [self.view addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(tipLabel2.mas_bottom).offset(0);
        make.height.mas_equalTo(10);
    }];
    lineView1.backgroundColor = [UIColor colorWithHex:@"#F0F1F5"];
    
    UIView *tipView1 = [[UIView alloc]init];
    [self.view addSubview:tipView1];
    [tipView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(lineView1.mas_bottom).offset(0);
        make.height.mas_equalTo(90);
    }];
    
    UILabel *tipLabel3 = [[UILabel alloc]init];
    [tipView1 addSubview:tipLabel3];
    tipLabel3.numberOfLines = 2;
    [tipLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(0);
        make.top.equalTo(tipView1.mas_top).offset(0);
        make.height.mas_equalTo(60);
    }];
    tipLabel3.font = [UIFont systemFontOfSize:12];
    tipLabel3.textColor = [UIColor lightGrayColor];
    NSString *string  = @"1.卖家同意或超时未处理,系统会自动退款给您 \n2.如果卖家拒绝,您可再次申请或联系平台";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 14; // 调整行间距
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    tipLabel3.attributedText = attributedString;
    
    
    UIButton *reviseOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tipView1 addSubview:reviseOrderButton];
    [reviseOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.top.equalTo(tipLabel3.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [reviseOrderButton setTitle:@"修改申请" forState:UIControlStateNormal];
    [reviseOrderButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [reviseOrderButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    
    
    UIButton *backOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tipView1 addSubview:backOrderButton];
    [backOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(reviseOrderButton.mas_left).offset(-20);
        make.top.equalTo(tipLabel3.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [backOrderButton setTitle:@"撤销申请" forState:UIControlStateNormal];
    [backOrderButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [backOrderButton.titleLabel setFont:[UIFont systemFontOfSize:12]];

    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.equalTo(tipView1.mas_bottom).offset(0);
                make.height.mas_equalTo(10);
    }];
  lineView2.backgroundColor = [UIColor colorWithHex:@"#F0F1F5"];
    
    
   
     UIView *goodsInfoView = [[UIView alloc]init];
     [self.view addSubview:goodsInfoView];
     [goodsInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.right.mas_equalTo(0);
         make.top.equalTo(lineView2.mas_bottom).offset(0);
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
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(goodsInfoView.mas_bottom).offset(0);
        make.height.mas_equalTo(10);
    }];
    lineView3.backgroundColor = [UIColor colorWithHex:@"#F0F1F5"];
    
    UILabel *tipsLabel1 = [[UILabel alloc]init];
    [self.view addSubview:tipsLabel1];
    [tipsLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(goodsInfoView.mas_bottom).offset(20);
        make.height.mas_equalTo(30);
    }];
    tipsLabel1.font = [UIFont systemFontOfSize:15];
    tipsLabel1.text = [NSString stringWithFormat:@"退款原因:   其他"];
    tipsLabel1.textColor = [UIColor lightGrayColor];
    
    UILabel *tipsLabel2 = [[UILabel alloc]init];
    [self.view addSubview:tipsLabel2];
    [tipsLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(tipsLabel1.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
    }];
    tipsLabel2.font = [UIFont systemFontOfSize:15];
    tipsLabel2.text = [NSString stringWithFormat:@"退款金额:   ¥392.50"];
    tipsLabel2.textColor = [UIColor lightGrayColor];
    
    
    UILabel *tipsLabel3 = [[UILabel alloc]init];
    [self.view addSubview:tipsLabel3];
    [tipsLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(tipsLabel2.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
    }];
    tipsLabel3.font = [UIFont systemFontOfSize:15];
    tipsLabel3.text = [NSString stringWithFormat:@"申请时间:   2019-04-12 13:20"];
    tipsLabel3.textColor = [UIColor lightGrayColor];
    
}

@end
