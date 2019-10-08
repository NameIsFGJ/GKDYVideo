//
//  MarkCollectionFootView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarkCollectionFootView.h"

@implementation MarkCollectionFootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(75, 25));
        
    }];
    [btn setTitle:@"查询更多" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 3.0f;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.borderWidth = .5;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:kFontSize(12)];
    return self;
}
@end
