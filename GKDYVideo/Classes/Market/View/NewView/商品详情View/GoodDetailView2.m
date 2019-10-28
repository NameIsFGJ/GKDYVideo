//
//  GoodDetailView2.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailView2.h"

@implementation GoodDetailView2
- (instancetype)init
{
    self = [super init];
    
    UIView *view0 = [[UIView alloc]init];
    [self addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *label00 = [[UILabel alloc]init];
    [view0 addSubview:label00];
    [label00 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(view0.mas_centerY);
    }];
    label00.text = @"图文详情";
    label00.textColor = [UIColor blackColor];
    label00.font = kFontSize(15);
    
    UIImageView *imageView0 = [[UIImageView alloc]init];
    [self addSubview:imageView0];
    [imageView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
         make.top.equalTo(view0.mas_bottom).offset(10);
        make.height.mas_equalTo(300);
    }];
    imageView0.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView1 = [[UIImageView alloc]init];
    [self addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(imageView0.mas_bottom).offset(10);
        make.height.mas_equalTo(300);
    }];
    imageView1.backgroundColor = [UIColor blueColor];
    
    

    
    return self;
}

@end
