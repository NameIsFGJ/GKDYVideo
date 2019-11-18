//
//  NewWaitPaySendBackPayDetailViewController.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/16.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewWaitPaySendBackPayDetailViewController.h"

@interface NewWaitPaySendBackPayDetailViewController ()

@end

@implementation NewWaitPaySendBackPayDetailViewController

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
    [leftButton addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)pushViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)makeUI
{
    UIView *contentView = [[UIView alloc]init];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowHeight - KTopViewHeight-88);
        make.top.mas_equalTo(KTopViewHeight);
    }];
    contentView.backgroundColor = kBgColor;
    
    UIView *view0 = [[UIView alloc]init];
    [contentView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(0);
        make.top.mas_equalTo(1);
        make.height.mas_equalTo(138);
    }];
    view0.backgroundColor = [UIColor redColor];
    UIView *view01 = [[UIView alloc]init];
    [view0 addSubview:view01];
    [view01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(55);
    }];
    UIImageView*imageView01 = [[UIImageView alloc]init];
    [view01 addSubview:imageView01];
    [imageView01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view01.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    imageView01.image = [UIImage imageNamed:@"tuikuanLogo"];
    
    UILabel *label01 = [[UILabel alloc]init];
    [view01 addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView01.mas_right).offset(10);
        make.centerY.equalTo(view01.mas_centerY);
    }];
    label01.text = @"等待商家处理";
    label01.textColor = [UIColor whiteColor];
    label01.font = [UIFont systemFontOfSize:15];
    
    UILabel *label02 = [[UILabel alloc]init];
    [view01 addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view01.mas_centerY);
        make.right.mas_equalTo(-15);
    }];
    label02.text = @"还剩1天12时59分";
    label02.textColor = [UIColor whiteColor];
    label02.font = [UIFont systemFontOfSize:12];
    label02.textAlignment = NSTextAlignmentRight;
    
    UILabel *label03 = [[UILabel alloc]init];
    [view01 addSubview:label03];
    [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label01.mas_left);
        make.right.mas_equalTo(-20);
        make.top.equalTo(view01.mas_bottom);
    }];
    label03.text = @".商家同意活着超时未处理,系统将退款\n.如果商家拒绝,您可以修改退款申请后再次发起,商家会重新处理.";
    label03.numberOfLines = 0;
    label03.textColor = [UIColor whiteColor];
    label03.font = [UIFont systemFontOfSize:14];
    
    //----------------------------view1-------------------------
    
    UIView *view1 = [[UIView alloc]init];
    [contentView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(0);
        make.height.mas_equalTo(45);
    }];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel *label11 = [[UILabel alloc]init];
    [view1 addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view1);
    }];
    label11.text = @"退款详情";
    label11.font = [UIFont systemFontOfSize:13];
    label11.textColor = [UIColor colorWithHex:@"#888888"];

    //----------------------------view2-------------------------
    UIView *view2 = [[UIView alloc]init];
    [contentView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(1);
        make.height.mas_equalTo(45);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    UILabel *label21 = [[UILabel alloc]init];
    [view2 addSubview:label21];
    [label21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view2);
    }];
    label21.text = @"退款原因";
    label21.font = [UIFont systemFontOfSize:15];
    label21.textColor = [UIColor blackColor];
    
    UILabel *label22 = [[UILabel alloc]init];
    [view2 addSubview:label22];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label21.mas_right).offset(40);
        make.centerY.equalTo(view2);
        
    }];
    label22.text =@"7天无理由";
    label22.font = [UIFont systemFontOfSize:15];
    label22.textColor = [UIColor blackColor];
    label22.textAlignment = NSTextAlignmentRight;
    
    //----------------------------view3-------------------------
    UIView *view3 = [[UIView alloc]init];
    [contentView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom).offset(1);
        make.height.mas_equalTo(45);
    }];
    view3.backgroundColor = [UIColor whiteColor];
    UILabel *label31 = [[UILabel alloc]init];
    [view3 addSubview:label31];
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view3);
    }];
    label31.text = @"退款金额";
    label31.font = [UIFont systemFontOfSize:15];
    label31.textColor = [UIColor blackColor];
    
    UILabel *label32 = [[UILabel alloc]init];
    [view3 addSubview:label32];
    [label32 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label31.mas_right).offset(40);
        make.centerY.equalTo(view3);
        
    }];
    label32.text =@"¥210.35";
    label32.font = [UIFont systemFontOfSize:15];
    label32.textColor = [UIColor blackColor];
    label32.textAlignment = NSTextAlignmentRight;
    
    //----------------------------view4-------------------------
    UIView *view4 = [[UIView alloc]init];
    [contentView addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view3.mas_bottom).offset(1);
        make.height.mas_equalTo(45);
    }];
    view4.backgroundColor = [UIColor whiteColor];
    UILabel *label41 = [[UILabel alloc]init];
    [view4 addSubview:label41];
    [label41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view4);
    }];
    label41.text = @"申请时间";
    label41.font = [UIFont systemFontOfSize:15];
    label41.textColor = [UIColor blackColor];
    
    UILabel *label42 = [[UILabel alloc]init];
    [view4 addSubview:label42];
    [label42 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label31.mas_right).offset(40);
        make.centerY.equalTo(view4);
        
    }];
    label42.text =@"2019-10-13";
    label42.font = [UIFont systemFontOfSize:15];
    label42.textColor = [UIColor blackColor];
    label42.textAlignment = NSTextAlignmentRight;
    
    
    //-----------------view5------------------------
    
    UIView *view5 = [[UIView alloc]init];
    [contentView addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(56);
        make.top.equalTo(view4.mas_bottom).offset(1);
    }];
    view5.backgroundColor = [UIColor whiteColor];
    
    UIButton *button51 = [UIButton buttonWithType:UIButtonTypeCustom];
    [view5 addSubview:button51];
    [button51 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.equalTo(view5.mas_width).multipliedBy(.5);
    }];
    UIButton *button52 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [view5 addSubview:button52];
    [button52 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.equalTo(view5.mas_width).multipliedBy(.5);
    }];
    
    [button51 setImage:[UIImage imageNamed:@"xx_icon"] forState:UIControlStateNormal];
    [button51 setTitle:@"联系卖家" forState:UIControlStateNormal];
    [button51 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button51.titleLabel.font = [UIFont systemFontOfSize:16];
    button51.titleEdgeInsets = UIEdgeInsetsMake(0,5, 0, -5);
    [button51 addTarget:self action:@selector(button51Action) forControlEvents:UIControlEventTouchUpInside];
    [button52 setImage:[UIImage imageNamed:@"dh_icon"] forState:UIControlStateNormal];
    [button52 setTitle:@"拨打电话" forState:UIControlStateNormal];
    [button52 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button52.titleLabel.font = [UIFont systemFontOfSize:16];
    button52.titleEdgeInsets = UIEdgeInsetsMake(0,5, 0, -5);
    [button52 addTarget:self action:@selector(button52Action) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view6 = [[UIView alloc]init];
    [contentView addSubview:view6];
    [view6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(63);
    }];
    view6.backgroundColor = [UIColor whiteColor];
    UIButton *button61 = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:button61];
    [button61 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view6.mas_centerY);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(80, 30));
        
    }];
    [button61 setTitle:@"取消退款" forState:UIControlStateNormal];
    button61.titleLabel.font = [UIFont systemFontOfSize:13];
    [button61 setBackgroundColor:kPickColor];
    [button61 addTarget:self action:@selector(button61Action) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button62 = [UIButton buttonWithType:UIButtonTypeCustom];
    [contentView addSubview:button62];
    [button62 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view6.mas_centerY);
        make.right.equalTo(button61.mas_left).offset(-30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
        
    }];
    [button62 addTarget:self action:@selector(button62Action) forControlEvents:UIControlEventTouchUpInside];
    [button62 setTitle:@"联系卖家" forState:UIControlStateNormal];
    button62.titleLabel.font = [UIFont systemFontOfSize:13];
    [button62 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button62 setBackgroundColor:[UIColor whiteColor]];
   // [button62 setBackgroundColor:kPickColor];
    button62.layer.borderWidth = .3;
    button62.layer.borderColor = [UIColor blackColor].CGColor;
    button62.layer.masksToBounds = YES;
    
}


// 联系卖家
- (void)button61Action
{
    NSLog(@"联系卖家");
}

// 拨打电话
- (void)button62Action
{
    NSLog(@"拨打电话");
}

@end
