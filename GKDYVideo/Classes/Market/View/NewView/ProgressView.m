//
//  ProgressView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pickView = [[UIView alloc]init];
        [self addSubview:self.pickView];
        [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        self.pickView.layer.cornerRadius = 3;
        self.pickView.backgroundColor = kPickColor;
        
        self.pickView = [[UIView alloc]init];
        [self addSubview:self.pickView];
        [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(10);
        }];
        self.pickView.layer.cornerRadius = 3;
        self.pickView.backgroundColor = kPickColor;
        
        self.disCountLabel = [[UILabel alloc]init];
        [self.pickView addSubview:self.disCountLabel];
        [self.disCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
        }];
        self.disCountLabel.font = [UIFont systemFontOfSize:9];
        self.disCountLabel.text = @"已抢3854件";
        self.disCountLabel.textColor = [UIColor colorWithHex:@"#941826"];
        
        self.percentLabel = [[UILabel alloc]init];
        [self.pickView addSubview:self.percentLabel];
        [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-5);
        }];
        self.percentLabel.font = [UIFont systemFontOfSize:9];
        self.percentLabel.text = @"10%";
        self.percentLabel.textColor = [UIColor colorWithHex:@"#941826"];
        
        
    }
    return self;
}
@end
