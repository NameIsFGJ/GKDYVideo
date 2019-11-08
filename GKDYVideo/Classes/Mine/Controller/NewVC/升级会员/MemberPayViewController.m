//
//  MemberPayViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MemberPayViewController.h"
#import "MemberSuccessViewController.h"
@interface MemberPayViewController ()
@property (strong, nonatomic)UIButton *selectButton2;
@property (strong, nonatomic)UIButton *selectButton3;
@property (assign, nonatomic)BOOL payType;
@end

@implementation MemberPayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeNav];
    [self makeUI];
    
}

- (void)makeNav
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopViewHeight+KStatusBarHeight+30);
        make.top.mas_equalTo(-KStatusBarHeight);
    }];
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = kPickColor;
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(KStatusBarHeight+15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [leftButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [imageView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.size.mas_equalTo(CGSizeMake(120, 50));
        make.top.equalTo(leftButton);
    }];
    titleLabel.text = @"开通会员";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    
}

- (void)makeUI
{
    UIView *view0 = [[UIView alloc]init];
    [self.view addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(KTopViewHeight+20);
        make.height.mas_equalTo(240);
    }];
    view0.layer.borderColor = [UIColor lightGrayColor].CGColor;
    view0.layer.borderWidth = .5;
    view0.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc]init];
    [view0 addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.equalTo(view0.mas_height).multipliedBy(.33);
    }];
   // view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc]init];
    [view0 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom);
        make.height.equalTo(view0.mas_height).multipliedBy(.33);
    }];
   // view2.backgroundColor = [UIColor blueColor];
    
    UIView *view3 = [[UIView alloc]init];
    [view0 addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom);
        make.height.equalTo(view0.mas_height).multipliedBy(.33);
    }];
  //  view3.backgroundColor = [UIColor yellowColor];
    
    UILabel *label0 = [[UILabel alloc]init];
    [view1 addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.equalTo(view1.mas_height).multipliedBy(.5);
    }];
    label0.textAlignment = NSTextAlignmentCenter;
    label0.text = @"总共需支付金额";
    label0.textColor = [UIColor lightGrayColor];
    label0.font = [UIFont systemFontOfSize:12];
    
    UILabel *label1 = [[UILabel alloc]init];
    [view1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(label0.mas_bottom);
         //make.height.equalTo(view1.mas_height).multipliedBy(.3);
    }];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"¥492.50";
    label1.textColor = [UIColor colorWithHex:@"#FF7751"];
    label1.font = [UIFont systemFontOfSize:15];
    
    // ------------------button 1
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zhifubao1"]];
    [view2 addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(view2.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(47, 47));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    [view2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView2.mas_right).offset(20);
        make.centerY.equalTo(view2.mas_centerY).offset(-10);
        
    }];
    label2.text = @"支付宝支付";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:10];
    
    UILabel *label3 = [[UILabel alloc]init];
    [view2 addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView2.mas_right).offset(20);
        make.centerY.equalTo(view2.mas_centerY).offset(10);
        
    }];
    label3.text = @"扫二维码领取红包支付更优惠";
    label3.textColor = [UIColor lightGrayColor];
    label3.font = [UIFont systemFontOfSize:10];
    
    self.selectButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:self.selectButton2];
    [self.selectButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view2.mas_centerY);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [self.selectButton2 setBackgroundImage:[UIImage imageNamed:@"member_image1"] forState:UIControlStateNormal];
    [self.selectButton2 setBackgroundImage:[UIImage imageNamed:@"zhifubao1"] forState:UIControlStateSelected];
    
    self.selectButton2.selected = YES;
    self.payType = YES;
    [self.selectButton2 addTarget:self action:@selector(selectButton2Action) forControlEvents:UIControlEventTouchUpInside];
    // ------------------button 2
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weixin1"]];
    [view3 addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view3).offset(12);
        make.centerY.equalTo(view3.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(47, 47));
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    [view3 addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView3.mas_right).offset(20);
        make.centerY.equalTo(view3.mas_centerY).offset(-10);
        
    }];
    label4.text = @"微信支付";
    label4.textColor = [UIColor blackColor];
    label4.font = [UIFont systemFontOfSize:10];
    
    UILabel *label5 = [[UILabel alloc]init];
    [view2 addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView3.mas_right).offset(20);
        make.centerY.equalTo(view3.mas_centerY).offset(10);
        
    }];
    label5.text = @"扫二维码领取红包支付更优惠";
    label5.textColor = [UIColor lightGrayColor];
    label5.font = [UIFont systemFontOfSize:10];
    
    self.selectButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view3 addSubview:self.selectButton3];
    [self.selectButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view3.mas_centerY);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    
    [self.selectButton3 setBackgroundImage:[UIImage imageNamed:@"member_image1"] forState:UIControlStateNormal];
    [self.selectButton3 setBackgroundImage:[UIImage imageNamed:@"weixin1"] forState:UIControlStateSelected];
    
    self.selectButton3.selected = NO;
    [self.selectButton3 addTarget:self action:@selector(selectButton3Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(-25);
        make.height.mas_equalTo(50);
    }];
    submitButton.layer.cornerRadius = 25;
    submitButton.layer.masksToBounds = YES;
    [submitButton setTitle:@"确认支付" forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [submitButton setBackgroundColor:kPickColor];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)selectButton2Action
{
    if (self.selectButton2.selected) {
    
    }
    else if (!self.selectButton2.selected)
    {
        self.selectButton2.selected = YES;
        self.selectButton3.selected = NO;
         self.payType = YES;
    }
    
    NSString *sess = self.payType?@"支付宝":@"微信";
    NSLog(@"sess  =%@",sess);
}

- (void)selectButton3Action
{
    if (self.selectButton3.selected) {
        
    }
    else if (!self.selectButton3.selected)
    {
        self.selectButton3.selected = YES;
        self.selectButton2.selected = NO;
        self.payType = NO;
    }
    NSString *sess = self.payType?@"支付宝":@"微信";
    NSLog(@"sess  =%@",sess);
}

- (void)submitButtonAction
{
    MemberSuccessViewController *vc = [[MemberSuccessViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
