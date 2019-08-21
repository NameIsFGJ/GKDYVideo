//
//  MarkCollectionHead2View.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarkCollectionHead2View.h"

@implementation MarkCollectionHead2View
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    UIView *grayView = [[UIView alloc]init];
    [self addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(25);
    }];
    grayView.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    
    UIView *contentView = [[UIView alloc]init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.top.equalTo(grayView.mas_bottom).offset(0);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [contentView addSubview:titleLabel];
    titleLabel.text = @"热门租赁";
    titleLabel.font = kFontSize(18);
    titleLabel.textColor = [UIColor blackColor];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(17);
        
        make.center.equalTo(contentView);
    }];
    
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionleftImage"]];
    [contentView addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLabel.mas_left).offset(-5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(68, 5));
    }];
    
    UIImageView *rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sectionRightImage"]];
    [contentView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_right).offset(5);
        make.centerY.equalTo(titleLabel);
        make.size.mas_equalTo(CGSizeMake(68, 5));
    }];
    
    return self;
}
@end
