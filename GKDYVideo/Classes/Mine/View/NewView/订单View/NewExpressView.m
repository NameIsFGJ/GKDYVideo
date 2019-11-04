//
//  NewExpressView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/11/4.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewExpressView.h"

@implementation NewExpressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = kBgColor;
        
        UIView *contentView = [[UIView alloc]init];
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(70);
        }];
        
        contentView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *goodImageView = [[UIImageView alloc]init];
        [contentView addSubview:goodImageView];
        [goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.equalTo(contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        goodImageView.backgroundColor = kPickColor;
        
        UILabel *label2 = [[UILabel alloc]init];
        [contentView addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerY.equalTo(contentView.mas_centerY);
             make.left.equalTo(goodImageView.mas_right).offset(10);
        }];
        label2.text = @"运单号:1235230292921";
        label2.font = kFontSize(12);
        
        UILabel *label1 = [[UILabel alloc]init];
        [contentView addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label2.mas_left);
            make.bottom.equalTo(label2.mas_top).offset(-5);
        }];
        label1.text = @"顺丰快递";
        label1.font = kFontSize(12);
        
        UILabel *label3 = [[UILabel alloc]init];
        [contentView addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label2.mas_left);
            make.top.equalTo(label2.mas_bottom).offset(5);
        }];
        label3.text = @"官方电话 95516";
        label3.font = kFontSize(12);
        
        UIView *whiteView = [[UIView alloc]init];
        [self addSubview:whiteView];
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(27);
        }];
        whiteView.backgroundColor = kWhiteColor;
        
    }
    return self;
}

@end
