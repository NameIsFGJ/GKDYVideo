//
//  MarketOrderViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketOrderViewController.h"
#import "AddressEditViewController.h"
#import "AddressListModel.h"
#import "ToPayView.h"
#import "AddNetworking.h"
@interface MarketOrderViewController ()
@property (strong, nonatomic) AddressListModel *model;
//  收件人
@property (strong, nonatomic) UILabel *userNameLabel;
//  地址
@property (strong, nonatomic) UILabel *userAddressLabel;
// 填写地址
@property (strong, nonatomic) UILabel *addAddressLabel;
// 数量
@property (strong, nonatomic) UILabel *countLabel;
// 单价
@property (strong, nonatomic) UILabel *priceLabel;
//  运费
@property (strong, nonatomic) UILabel *postMoneyLabel;
//  总价
@property (strong, nonatomic) UILabel *totalLabel;

@property (strong, nonatomic) ToPayView *payView;

@property (assign, nonatomic) NSInteger addressID;

// 总金额
@property (assign, nonatomic) float orderAmount;
// 商品数量
@property (assign, nonatomic) NSInteger goodsNum;

@end

@implementation MarketOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addressID = -1;
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
        make.top.mas_equalTo(KTopViewHeight + 30);
        make.height.mas_equalTo(90);
    }];
    
  // 地址
    self.addAddressLabel = [[UILabel alloc]init];
    [addressView addSubview:self.addAddressLabel];
    [self.addAddressLabel setTextColor:[UIColor blackColor]];
    [self.addAddressLabel setText:@"填写地址"];
    [self.addAddressLabel setFont:[UIFont systemFontOfSize:15]];
    [self.addAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addressView);
        make.left.mas_equalTo(12);
        make.height.mas_equalTo(20);
       
    }];
    
    self.userNameLabel = [[UILabel alloc]init];
    [addressView addSubview:self.userNameLabel];
    self.userNameLabel.text = @"刘刚  182****5313";
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.height.mas_equalTo(15);
    }];
    self.userNameLabel.hidden = YES;
    
   self.userAddressLabel = [[UILabel alloc]init];
    [addressView addSubview:self.userAddressLabel];
    self.userAddressLabel.numberOfLines = 2;
    [self.userAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-12);
    }];
    self.userAddressLabel.text = @"杭杭州市杭州市杭州市杭州市杭州市杭州市杭州市州市5幢603室";
    self.userAddressLabel.font = [UIFont systemFontOfSize:13];
    self.userAddressLabel.hidden = YES;
    
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
    shopNameLabel.text = [NSString stringWithFormat:@"%@的商铺",self.nickName];
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
    
   // UIImageView *imageListView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.image_list]];
    UIImageView *imageListView = [[UIImageView alloc]init];
    [imageListView sd_setImageWithURL:[NSURL URLWithString:self.image_list]];
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
    //nameLabel.text = @"奢华祖母绿戒指";
    nameLabel.text = self.name;
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    self.priceLabel = [[UILabel alloc]init];
    [orderView addSubview:self.priceLabel];
    self.priceLabel.textColor = [UIColor redColor];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left);
        make.bottom.equalTo(imageListView.mas_bottom);
        make.height.mas_equalTo(15);
    }];
   // self.priceLabel.text = @"¥25.50";
    self.priceLabel.text = self.price;
    self.priceLabel.font = [UIFont systemFontOfSize:15];
    
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
    
    self.countLabel = [[UILabel alloc]init];
    [contentView addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(28*2, 28));
        make.right.equalTo(addButton.mas_left).offset(0);
    }];
    self.countLabel.text = @"1";
    self.count = 6;
    self.countLabel.font = [UIFont systemFontOfSize:15];
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    self.countLabel.layer.borderWidth = .5;
    self.countLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countLabel.layer.masksToBounds = YES;
    
    UIButton *subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:subButton];
    [subButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.countLabel.mas_left).offset(0);
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
    
    self.postMoneyLabel = [[UILabel alloc]init];
    [contentView addSubview:self.postMoneyLabel];
    [self.postMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(label2.mas_centerY);
        make.height.mas_equalTo(15);
    }];
    self.postMoneyLabel.textColor = [UIColor redColor];
   // self.postMoneyLabel.text = @"¥20.00";
    self.postMoneyLabel.text = [NSString stringWithFormat:@"¥ %ld",self.postMoney];
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
    
   self.totalLabel = [[UILabel alloc]init];
    [self.view addSubview:self.totalLabel];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(submitButton.mas_centerY);
        make.height.mas_equalTo(18);
    }];
    self.totalLabel.textColor = [UIColor redColor];
    self.totalLabel.font = [UIFont systemFontOfSize:22];
    //self.totalLabel.text = @"¥00.00";
    float price = [self.price floatValue];
    
    // 运费
    float postMoney = self.postMoney;
    
    float total = price *1 + postMoney;
    
    
    self.totalLabel.text = [NSString stringWithFormat:@"¥ %.2f",total];
    
    
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
    //NSInteger count;
    if (btn.tag == 100)
    {
        NSLog(@"减法");
        NSInteger count = [self.countLabel.text integerValue];
        count --;
        
        if (count < 1) {
            count = 1;
        }
        self.countLabel.text = [NSString stringWithFormat:@"%ld",count];
        
        // 单价
        float price = [self.price floatValue];
        
        // 运费
        float postMoney = self.postMoney;
        
        float total = price *count + postMoney;
        
        self.totalLabel.text = [NSString stringWithFormat:@"¥ %.2f",total];
        
        self.orderAmount = total;
        self.goodsNum = count;
        
    }else if (btn.tag == 101)
    {
       
       NSInteger count = [self.countLabel.text integerValue];
        count ++;
        
        if (count > self.count) {
            count = self.count;
        }
        
        self.countLabel.text = [NSString stringWithFormat:@"%ld",count];
//        if (count <= self.count) {
//            self.countLabel.text = [NSString stringWithFormat:@"%ld",count];
//        }
        
        // 计算  总价 =  单价 * 数量 + 运费
        //       total = price * count + postMoney
        // 单价
        float price = [self.price floatValue];
        
        // 运费
        float postMoney = self.postMoney;
        
        float total = price *count + postMoney;
        
        self.totalLabel.text = [NSString stringWithFormat:@"¥ %.2f",total];
        
        self.orderAmount = total;
        self.goodsNum = count;
    }
}

- (void)pushAddressButtonAction
{
    AddressEditViewController *vc = [[AddressEditViewController alloc]init];
    vc.block = ^(AddressListModel * _Nullable model) {
        
        self.userNameLabel.hidden = NO;
        self.userAddressLabel.hidden = NO;
        self.addAddressLabel.hidden = YES;
      //  NSLog(@"model.address  =%@",model.address);
        self.addressID = model.ide;
        NSString *mobile = [model.mobile stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        self.userNameLabel.text = [NSString stringWithFormat:@"%@    %@",model.consignee,mobile];
        NSString *address = [model.city stringByReplacingOccurrencesOfString:@"/" withString:@" "];
        self.userAddressLabel.text = [NSString stringWithFormat:@"%@%@",model.city,address];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushContactButtonAction
{
    NSLog(@"联系商家");
}

- (void)submitButtonAction
{
    NSLog(@"提交订单");
    if (self.addressID == -1) {
        [self showErrorMsg:@"请选择收货地址"];
        return;
    }
    
    [AddNetworking postAddWithToken:kUser.user_token
                        withGoodsID:self.model.ide
                        withSalerID:[kUser.user_id integerValue]
                      withAddressID:self.addressID
                    withOrderAmount:self.orderAmount
                     withGoodsPrice:[self.price floatValue]
                       withGoodsNum:self.goodsNum completion:^(NSInteger orderNum, NSError * _Nonnull error) {
                           
                           [self.view addSubview:self.payView];
                           self.payView.orderSn = orderNum;
                           self.payView.frame = self.view.bounds;
                           
    }];
    
   
    
}

#pragma mark 懒加载
- (ToPayView *)payView
{
    if (!_payView) {
        _payView = [[ToPayView alloc]init];
    }
    return _payView;
}

@end
