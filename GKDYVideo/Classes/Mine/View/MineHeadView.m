//
//  MineHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MineHeadView.h"
#import "SetViewController.h"
#import "PrefixHeader.pch"

@implementation MineHeadView

- (instancetype)init
{
    self = [super init];
    
    UIView *view0 = [[UIView alloc]init];
    [self addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    view0.backgroundColor = kMainColor;
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [view0 addSubview:self.rightButton];
    [self.rightButton setImage:[UIImage imageNamed:@"setImage"] forState:UIControlStateNormal];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-13);
        make.top.mas_equalTo(KStatusBarHeight +10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    UIView *view1 = [[UIView alloc]init];
    [self addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view0.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    view1.backgroundColor = kMainColor;
    
    UIView *view2 = [[UIView alloc]init];
    [self addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    view2.backgroundColor = [UIColor whiteColor];
    
    self.head_pic = [[UIImageView alloc]init];
    [self addSubview:self.head_pic];
    [self.head_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(view1.mas_bottom).offset(-43);
        make.size.mas_equalTo(CGSizeMake(86, 86));
    }];
    self.head_pic.image = [UIImage imageNamed:@"chat_icon"];
    self.head_pic.layer.cornerRadius =86/2.0f;
    self.head_pic.layer.masksToBounds = YES;
    
    self.nickNameLabel = [[UILabel alloc]init];
    [self addSubview:self.nickNameLabel];
    self.nickNameLabel.textColor = [UIColor whiteColor];
    self.nickNameLabel.text = @"漫饭一号";
    self.nickNameLabel.font = kFontSize(15);
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view1.mas_bottom).offset(-10);
        make.left.equalTo(self.head_pic.mas_right).offset(5);
    }];
    
    self.mfNumberLabel = [[UILabel alloc]init];
    [view2 addSubview:self.mfNumberLabel];
    [self.mfNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.equalTo(self.head_pic.mas_right).offset(5);
    }];
    self.mfNumberLabel.textColor = [UIColor blackColor];
    self.mfNumberLabel.font = kFontSize(12);
    self.mfNumberLabel.text = @"我的漫饭号:2342929224";
    
    return self;
}


@end
