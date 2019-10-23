//
//  GoodDetailView0.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GoodDetailView0.h"

@interface GoodDetailView0()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) SDCycleScrollView *scrollView;
@end

@implementation GoodDetailView0

- (instancetype)init
{
    self = [super init];
    
    self.backgroundColor = [UIColor blueColor];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(280);
    }];
    
    UIView *view2 = [[UIView alloc]init];
    [self addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
     
        make.top.equalTo(self.scrollView.mas_bottom);
        make.height.mas_equalTo(100);
    }];
    
    UILabel *label20 = [[UILabel alloc]init];
    [view2 addSubview:label20];
    [label20 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-12);
    }];
    label20.text = @"CBD全新上市柔软新鲜时尚温馨小型沙发馨小型沙发馨小型沙发";
    label20.font = [UIFont systemFontOfSize:18];
    label20.numberOfLines = 2;
    UILabel *label21 = [[UILabel alloc]init];
    [view2 addSubview:label21];
    [label21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label20.mas_left);
        make.top.equalTo(label20.mas_bottom).offset(10);
    }];
    label21.text = @"低至八折| 全新上市";
    label21.font = [UIFont systemFontOfSize:14];
    
    UILabel *label22 = [[UILabel alloc]init];
    [view2 addSubview:label22];
    [label22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label20.mas_left);
        make.top.equalTo(label21.mas_bottom).offset(15);
        
    }];
    label22.text = @"¥520";
    label22.textColor = kPickColor;
    label22.font = [UIFont systemFontOfSize:24];
    
    UILabel *label23 = [[UILabel alloc]init];
    [view2 addSubview:label23];
    [label23 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label22.mas_right).offset(10);
        make.bottom.equalTo(label22.mas_bottom);
        
    }];
    label23.text = @"价格";
    label23.textColor = kBgColor;
    label23.font = [UIFont systemFontOfSize:13];
    
    UILabel *label24 = [[UILabel alloc]init];
    [view2 addSubview:label24];
    [label24 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(label23.mas_right).offset(15);
       make.bottom.equalTo(label22.mas_bottom);
        
    }];
    label24.text = @"¥699";
    label24.textColor = kBgColor;
    label24.font = [UIFont systemFontOfSize:13];
    
    UILabel *label25 = [[UILabel alloc]init];
    [view2 addSubview:label25];
    [label25 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.bottom.equalTo(label22.mas_bottom);
    }];
    label25.text = @"已售3521件";
    label25.textColor = kBgColor;
    label25.font = [UIFont systemFontOfSize:13];
    
    UIImageView *memberImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"memberUpImage"]];
    [self addSubview:memberImageView];
    [memberImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(view2.mas_bottom).offset(15);
        make.height.mas_equalTo(44);
    }];
    
    UILabel *label26 = [[UILabel alloc]init];
    [memberImageView addSubview:label26];
    [label26 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(30);
    }];
    label26.text = @"升级VIP会员 此商品可省¥39元 | 立即开通";
    label26.textAlignment = NSTextAlignmentCenter;
    label26.textColor = [UIColor colorWithRed:215/255.0f green:185/255.0f blue:158/255.0f alpha:1];
    label26.font = [UIFont systemFontOfSize:14];
    
    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(pushMemberAction)];
    
    [memberImageView addGestureRecognizer:tap];
    
    UIView *view3 = [[UIView alloc]init];
    [self addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(memberImageView.mas_bottom).offset(10);
    }];
    
    UILabel *label30 = [[UILabel alloc]init];
    [view3 addSubview:label30];
    [label30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(view3.mas_centerY);
        make.height.mas_equalTo(15);
    }];
    label30.text = @"优惠券";
    label30.backgroundColor = kPickColor;
    
    
    
    
    return self;
}

- (void)pushMemberAction
{
    
}

#pragma mark scrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"点击图片");
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;
{
    
}

- (SDCycleScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[SDCycleScrollView alloc]init];
        _scrollView.localizationImageNamesGroup = @[@"banner",@"banner"];
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}
@end
