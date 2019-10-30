//
//  NewMineView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewMineView.h"

@interface NewMineView()

@end

@implementation NewMineView

- (instancetype)init
{
    self = [super init];
    self.backgroundColor = [UIColor colorWithRed:246/255.0f green:248/255.0f blue:250/255.0f alpha:1];
    
    NSArray *titleArray = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退货/售后"];
    NSArray *imageArray = @[@"fk_icon",@"fahuo_icon",@"dsh_icon",@"pj_icon",@"th_icon"];
    
    
    UIView *view0 = [[UIView alloc]init];
    [self addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    view0.backgroundColor = [UIColor whiteColor];
    UIImageView *headImage = [[UIImageView alloc]init];
    [view0 addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(56, 56));
    }];
    headImage.layer.cornerRadius = 56/2;
    headImage.layer.masksToBounds = YES;
    headImage.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushCenterVC)];
    [headImage addGestureRecognizer:tap];
    headImage.userInteractionEnabled = YES;
    
    
    UILabel *nickNameLabel = [[UILabel alloc]init];
    [view0 addSubview:nickNameLabel];
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headImage.mas_right).offset(5);
        make.top.mas_equalTo(5);
    }];
    nickNameLabel.font = [UIFont systemFontOfSize:15.0f];
    nickNameLabel.text = @"漫饭235";

    UIButton *authorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:authorButton];
    [authorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickNameLabel.mas_left);
        make.top.equalTo(nickNameLabel.mas_bottom).offset(2);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    authorButton.titleLabel.font = [UIFont systemFontOfSize:14];

    [authorButton layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleRight imageTitleSpace:3];
    [authorButton setImage:[UIImage imageNamed:@"guanjun"] forState:UIControlStateNormal];
    [authorButton setTitle:@"已认证" forState:UIControlStateNormal];
    [authorButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    authorButton.titleLabel.font = [UIFont systemFontOfSize:13];

    UILabel *fansLabel = [[UILabel alloc]init];
    [view0 addSubview:fansLabel];
    [fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(nickNameLabel.mas_left);
       make.top.equalTo(authorButton.mas_bottom).offset(5);
       // make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

    fansLabel.textAlignment = NSTextAlignmentCenter;
    fansLabel.font = [UIFont systemFontOfSize:12];
    fansLabel.text = @"23 粉丝";
    UIView *lineView0 = [[UIView alloc]init];
    [view0 addSubview:lineView0];
    [lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fansLabel.mas_right).offset(10);
        make.top.equalTo(fansLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(.5, 13));
    }];
    lineView0.backgroundColor = [UIColor lightGrayColor];

    UILabel *followLabel = [[UILabel alloc]init];
    [view0 addSubview:followLabel];
    [followLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView0.mas_right).offset(10);
        make.top.equalTo(fansLabel.mas_top);
       // make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    followLabel.textAlignment = NSTextAlignmentCenter;
    followLabel.text = @"2011 关注";
    followLabel.font = [UIFont systemFontOfSize:12];
    UIView *lineView1 = [[UIView alloc]init];
    [view0 addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(followLabel.mas_right).offset(10);
        make.top.equalTo(fansLabel.mas_top);
        make.size.mas_equalTo(CGSizeMake(.5, 13));
    }];
    lineView1.backgroundColor = [UIColor lightGrayColor];

    UILabel *contentLabel = [[UILabel alloc]init];
    [view0 addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1.mas_right).offset(10);
        make.top.equalTo(fansLabel.mas_top);
       // make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = @"2011 动态";
    contentLabel.font = [UIFont systemFontOfSize:12];

    UIButton *myTopicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:myTopicButton];
    [myTopicButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.top.equalTo(authorButton.mas_top);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];

    [myTopicButton layoutButtonWithEdgeInsetsStyle:CLButtonEdgeInsetsStyleTitleLeft imageTitleSpace:5];
    [myTopicButton setTitle:@"我的饭圈 >" forState:UIControlStateNormal];
    [myTopicButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    myTopicButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [myTopicButton addTarget:self action:@selector(myTopicButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIView *view1 = [[UIView alloc]init];
    [self addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view0.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
   // view1.backgroundColor = [UIColor redColor];
    UIButton *memberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view1 addSubview:memberButton];
    [memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0,0,0,0));
    }];
    [memberButton setImage:[UIImage imageNamed:@"memberImage"] forState:UIControlStateNormal];
    [memberButton addTarget:self action:@selector(memberButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIView *view2 = [[UIView alloc]init];
    [self addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view1.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    UILabel *orderLabel = [[UILabel alloc]init];
    [view2 addSubview:orderLabel];
    [orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view2.mas_centerY);
        make.width.mas_equalTo(100);
    }];
    orderLabel.text = @"我的订单";
    orderLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    UIButton *orderAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view2 addSubview:orderAllButton];
    [orderAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(view2.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    [orderAllButton setTitle:@"查看全部 >" forState:UIControlStateNormal];
    [orderAllButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    orderAllButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [orderAllButton addTarget:self action:@selector(orderAllButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIView *view3 = [[UIView alloc]init];
    [self addSubview:view3];

    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom).offset(1);
        make.height.mas_equalTo(90);
    }];
    view3.backgroundColor = [UIColor whiteColor];

    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view3 addSubview:btn];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10+(kWindowWidth/5 * i));
            make.centerY.equalTo(view3.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(kWindowWidth/5 -20, kWindowWidth/5 -20));
        }];
        UIImageView *imageView = [[UIImageView alloc]init];
        [btn addSubview:imageView];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(20);
        }];
        imageView.contentMode = UIViewContentModeCenter;
        UILabel *label = [[UILabel alloc]init];
        [btn addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(imageView.mas_bottom).offset(5);
        }];
        label.text = titleArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.adjustsFontSizeToFitWidth = YES;
        
    }
    

    UIView *view4 = [[UIView alloc]init];
    [self addSubview:view4];
    view4.backgroundColor = [UIColor whiteColor];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view3.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
    }];
    UILabel *walletLabl = [[UILabel alloc]init];
    [view4 addSubview:walletLabl];
    [walletLabl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(view4.mas_centerY);
        make.width.mas_equalTo(100);
    }];
    walletLabl.text = @"我的钱包";
    walletLabl.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];

    UIView *view5 = [[UIView alloc]init];
    [self addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view4.mas_bottom).offset(1);
        make.height.mas_equalTo(90);
    }];
    view5.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *moneyLabel = [[UILabel alloc]init];
    [view5 addSubview:moneyLabel];
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.textColor = [UIColor colorWithHex:@"#F76C8D"];
    moneyLabel.text = @"30.00";

    UILabel *redPacketLabel = [[UILabel alloc]init];
    [view5 addSubview:redPacketLabel];
    redPacketLabel.textAlignment = NSTextAlignmentCenter;
    redPacketLabel.textColor = [UIColor colorWithHex:@"#F76C8D"];
    redPacketLabel.text = @"5";

    UILabel *disCountLabel = [[UILabel alloc]init];
    [view5 addSubview:disCountLabel];
    disCountLabel.textAlignment = NSTextAlignmentCenter;
    disCountLabel.textColor = [UIColor colorWithHex:@"#F76C8D"];
    disCountLabel.text = @"1";

    NSArray *array2 = [NSArray arrayWithObjects:moneyLabel,redPacketLabel,disCountLabel, nil];
    [array2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [array2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view5.mas_centerY).offset(-10);
        make.height.mas_equalTo(view5.mas_height).multipliedBy(.3);
    }];
    
    UILabel *tipLabel0 = [[UILabel alloc]init];
    [view5 addSubview:tipLabel0];
    tipLabel0.text = @"余额";
    tipLabel0.textAlignment = NSTextAlignmentCenter;
    tipLabel0.font = [UIFont systemFontOfSize:14];
    tipLabel0.textColor = [UIColor blackColor];

    UILabel *tipLabel1 = [[UILabel alloc]init];
    [view5 addSubview:tipLabel1];
    tipLabel1.text = @"红包";
    tipLabel1.font = [UIFont systemFontOfSize:14];
    tipLabel1.textColor = [UIColor blackColor];
    tipLabel1.textAlignment = NSTextAlignmentCenter;
    
    UILabel *tipLabel2 = [[UILabel alloc]init];
    [view5 addSubview:tipLabel2];
    tipLabel2.text = @"优惠券";
    tipLabel2.textAlignment = NSTextAlignmentCenter;
    tipLabel2.font = [UIFont systemFontOfSize:14];
    tipLabel2.textColor = [UIColor blackColor];
    
    NSArray *array3 = [NSArray arrayWithObjects:tipLabel0,tipLabel1,tipLabel2, nil];
    [array3 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [array3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moneyLabel.mas_bottom).offset(0);
    }];
    
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view5 addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i *kWindowWidth/3);
            make.top.equalTo(view5.mas_top);
            make.size.mas_equalTo(CGSizeMake(kWindowWidth/3, 90));
        }];
        btn.tag = 200 +i;
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    return self;
}

#pragma mark Action

// 点击头像
- (void)pushCenterVC
{
    NSLog(@"点击头像");
    if ([self.delegate respondsToSelector:@selector(headViewCenterButtonClick)])
    {
        [self.delegate headViewCenterButtonClick];
    }
}

// 我的饭圈
- (void)myTopicButtonAction
{
    if ([self.delegate respondsToSelector:@selector(headViewTopicButtonClick)]) {
        [self.delegate headViewTopicButtonClick];
    }
}

// 升级会员
- (void)memberButtonAction
{
    if ([self.delegate respondsToSelector:@selector(headViewMemberButtonClick)]) {
        [self.delegate headViewMemberButtonClick];
    }
}

//  查看全部订单
- (void)orderAllButtonAction
{
    if ([self.delegate respondsToSelector:@selector(headViewOrderAllButtonClick)]) {
        [self.delegate headViewOrderAllButtonClick];
    }
}


- (void)buttonAction:(UIButton *)btn
{
    // 待付款
    if (btn.tag == 100)
    {
        
        if ([self.delegate respondsToSelector:@selector(headViewWaitPayButtonClick)]) {
            [self.delegate headViewWaitPayButtonClick];
        }
        // 待发货
    }else if (btn.tag == 101)
    {
        if ([self.delegate respondsToSelector:@selector(headViewWaitSendButtonClick)]) {
            [self.delegate headViewWaitSendButtonClick];
        }
        //待收货
    }else if (btn.tag == 102)
    {
        if ([self.delegate respondsToSelector:@selector(headViewWaitReceiveButtonClick)]) {
            [self.delegate headViewWaitReceiveButtonClick];
        }
        // 待评价
    }else if (btn.tag == 103)
    {
       
        if ([self.delegate respondsToSelector:@selector(headViewWaitDiscussButtonClick)]) {
            [self.delegate headViewWaitDiscussButtonClick];
        }
    }// 退货/售后
    else if (btn.tag == 104)
    {
        if ([self.delegate respondsToSelector:@selector(headViewServeButtonClick)]) {
            [self.delegate headViewServeButtonClick];
        }
        // 余额
    }else if (btn.tag == 200){
        if ([self.delegate respondsToSelector:@selector(headViewMoneyButtonClick)]) {
            [self.delegate headViewMoneyButtonClick];
        }
        // 红包
    }else if (btn.tag == 201){
        if ([self.delegate respondsToSelector:@selector(headViewRedPacketButtonClick)]) {
            [self.delegate headViewRedPacketButtonClick];
        }
        // 优惠券
    }else if (btn.tag == 202){
        if ([self.delegate respondsToSelector:@selector(headViewDiscountButtonClick)]) {
            [self.delegate headViewDiscountButtonClick];
        }
    }
}

@end
