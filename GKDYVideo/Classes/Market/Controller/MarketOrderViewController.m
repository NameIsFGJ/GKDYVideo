//
//  MarketOrderViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketOrderViewController.h"

@interface MarketOrderViewController ()

@end

@implementation MarketOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO];
    [self makeNav];
    [self makeUI];
    
}

- (void)makeNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"确认订单";
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
    UIView *addressView = [[UIView alloc]init];
    [self.view addSubview:addressView];
    [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(90);
        make.height.mas_equalTo(90);
    }];
    
  // 地址
    UILabel *addAddressLabel = [[UILabel alloc]init];
    [addressView addSubview:addAddressLabel];
    [addAddressLabel setTextColor:[UIColor blackColor]];
    [addAddressLabel setText:@"填写地址"];
    [addAddressLabel setFont:[UIFont systemFontOfSize:15]];
    [addAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addressView);
        make.left.mas_equalTo(12);
        make.height.mas_equalTo(20);
       
    }];
    
    UILabel *userNameLabel = [[UILabel alloc]init];
    [addressView addSubview:userNameLabel];
    userNameLabel.text = @"刘刚  182****5313";
    [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.height.mas_equalTo(15);
    }];
    userNameLabel.hidden = YES;
    
    UILabel *userAddressLabel = [[UILabel alloc]init];
    [addressView addSubview:userAddressLabel];
    userAddressLabel.numberOfLines = 2;
    [userAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(userNameLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-12);
    }];
    userAddressLabel.text = @"杭杭州市杭州市杭州市杭州市杭州市杭州市杭州市州市5幢603室";
    userAddressLabel.font = [UIFont systemFontOfSize:13];
    userAddressLabel.hidden = YES;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_back"]];
    [addressView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addressView);
        make.size.mas_equalTo(CGSizeMake(16, 16));
        make.right.mas_equalTo(-10);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushAddressButtonAction)];
    [addressView addGestureRecognizer:tap];
    
     //  购买信息
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(addressView.mas_bottom).offset(0);
        make.height.mas_equalTo(280);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    [contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(.5);
    }];
    lineView.backgroundColor = [UIColor lightGrayColor];

    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shangPu"]];
    [contentView addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(lineView.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(18, 19));
    }];

    UILabel *shopNameLabel = [[UILabel alloc]init];
    [contentView addSubview:shopNameLabel];
    shopNameLabel.text = @"漫饭一号的商铺";
    shopNameLabel.font = [UIFont systemFontOfSize:15];
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView1.mas_right).offset(5);
        make.centerY.equalTo(imageView1.mas_centerY);
        make.height.mas_equalTo(15);
    }];
    
    UIButton *contactUserButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:contactUserButton];
    [contactUserButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [contactUserButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [contactUserButton setTitle:@"联系商家" forState:UIControlStateNormal];
    [contactUserButton addTarget:self action:@selector(pushContactButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [contactUserButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(65, 15));
    }];
    
    UIView *orderView = [[UIView alloc]init];
    [contentView addSubview:orderView];
    orderView.backgroundColor = [UIColor colorWithHex:@"#F0F1F5" alpha:1];
    [orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
        make.top.equalTo(imageView1.mas_bottom).offset(15);
    }];
    
    UIImageView *imageListView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.image_list]];
    [orderView addSubview:imageListView];
    [imageListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.centerY.equalTo(orderView.mas_centerY);
    }];
    imageListView.backgroundColor = [UIColor whiteColor];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [orderView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageListView.mas_right).offset(12);
        make.top.equalTo(imageListView.mas_top).offset(20);
        make.height.mas_equalTo(15);
    }];
    nameLabel.text = @"奢华祖母绿戒指";
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    [orderView addSubview:priceLabel];
    priceLabel.textColor = [UIColor redColor];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left);
        make.bottom.equalTo(imageListView.mas_bottom);
        make.height.mas_equalTo(15);
    }];
    priceLabel.text = @"¥25.50";
    priceLabel.font = [UIFont systemFontOfSize:15];
    
    UILabel *label1 = [[UILabel alloc]init];
    [contentView addSubview:label1];
    label1.text = @"数量";
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(orderView.mas_bottom).offset(20);
        make.height.mas_equalTo(15);
    }];
    label1.font = [UIFont systemFontOfSize:15];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(label1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(countButtonActon:) forControlEvents:UIControlEventTouchUpInside];
    addButton.tag =101;
    addButton.layer.borderWidth = .5;
    addButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    addButton.layer.masksToBounds = YES;
    [addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    UILabel *countLabel = [[UILabel alloc]init];
    [contentView addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(28*2, 28));
        make.right.equalTo(addButton.mas_left).offset(0);
    }];
    countLabel.text = @"1";
    countLabel.font = [UIFont systemFontOfSize:15];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.layer.borderWidth = .5;
    countLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    countLabel.layer.masksToBounds = YES;
    
    UIButton *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:subButton];
    [subButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(countLabel.mas_left).offset(0);
        make.centerY.equalTo(label1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    [subButton setTitle:@"-" forState:UIControlStateNormal];
    [subButton addTarget:self action:@selector(countButtonActon:) forControlEvents:UIControlEventTouchUpInside];
    subButton.tag =100;
    [subButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    subButton.layer.borderWidth = .5;
    subButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    subButton.layer.masksToBounds = YES;
    
    UIView *lineView2 = [[UIView alloc]init];
    [contentView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label1.mas_bottom).offset(20);
        make.height.mas_equalTo(10);
    }];
    lineView2.backgroundColor = [UIColor colorWithHex:@"#F0F1F5"];
    
    UILabel *label2 = [[UILabel alloc]init];
    [contentView addSubview:label2];
    label2.text = @"运费";
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(15);
    }];
    label2.font = [UIFont systemFontOfSize:15];
    
    UILabel *postMoneyLabel = [[UILabel alloc]init];
    [contentView addSubview:postMoneyLabel];
    [postMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(label2.mas_centerY);
        make.height.mas_equalTo(15);
    }];
    postMoneyLabel.textColor = [UIColor redColor];
    postMoneyLabel.text = @"¥20.00";
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 49));
    }];
    submitButton.backgroundColor = [UIColor orangeColor];
    [submitButton setTitle:@"确认付款" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label3 = [[UILabel alloc]init];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.centerY.equalTo(submitButton.mas_centerY);
        make.height.mas_equalTo(18);
    }];
    label3.text = @"实付:";
    
    UILabel * totalLabel = [[UILabel alloc]init];
    [self.view addSubview:totalLabel];
    [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(submitButton.mas_centerY);
        make.height.mas_equalTo(18);
    }];
    totalLabel.text = @"¥391.30";
    totalLabel.textColor = [UIColor redColor];
    totalLabel.font = [UIFont systemFontOfSize:18];
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(.5);
        make.bottom.equalTo(submitButton.mas_top).offset(0);
    }];
    
    lineView3.backgroundColor = [UIColor lightGrayColor];
}


- (void)countButtonActon:(UIButton *)btn
{
    if (btn.tag == 100)
    {
        NSLog(@"减法");
    }else if (btn.tag == 101)
    {
        NSLog(@"加法");
    }
}

- (void)pushAddressButtonAction
{
    NSLog(@"填写地址");
}

- (void)pushContactButtonAction
{
    NSLog(@"联系商家");
}

- (void)submitButtonAction
{
    NSLog(@"提交订单");
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
