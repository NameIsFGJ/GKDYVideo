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
    
    UIView *view22 = [[UIView alloc]init];
    [self addSubview:view22];
    
    [view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.equalTo(view2.mas_bottom).offset(0);
        make.height.mas_equalTo(44);
    }];
    
    UIImageView *memberImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"memberUpImage"]];
    [view22 addSubview:memberImageView];
    
    [memberImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
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

    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushMemberAction)];
    [view22 addGestureRecognizer:tap2];
  
    UIView *view3 = [[UIView alloc]init];
    [self addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(view22.mas_bottom).offset(0);
        make.height.mas_equalTo(60);
    }];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushDiscountView)];
    [view3 addGestureRecognizer:tap3];
    
    UILabel *label30 = [[UILabel alloc]init];
    [view3 addSubview:label30];
    [label30 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(view3.mas_centerY);
    }];
    label30.text = @"优惠券";
    label30.textColor = [UIColor whiteColor];
    label30.backgroundColor = kPickColor;
    
    UILabel *label31 = [[UILabel alloc]init];
    [view3 addSubview:label31];
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(view3.mas_centerY);
    }];
    label31.textColor = kPickColor;
    label31.text = @">";
    
    UILabel *label32 = [[UILabel alloc]init];
    [view3 addSubview:label32];
    [label32 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label30.mas_right);
        make.centerY.equalTo(view3.mas_centerY);
        make.width.mas_equalTo(250);
    }];
    label32.textColor = kStringColor;
    label32.textAlignment = NSTextAlignmentCenter;
    label32.text = @"满200减10  满300减20";
    label32.font = [UIFont systemFontOfSize:12];
    UIView *lineView3 = [[UIView alloc]init];
    [view3 addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.height.mas_equalTo(.5);
        make.left.right.mas_equalTo(0);
    }];
    lineView3.backgroundColor = kBgColor;
    
    UIView *view4 = [[UIView alloc]init];
    [self addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(view3.mas_bottom);
        make.height.mas_equalTo(200);
    }];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushShopView)];
    [view4 addGestureRecognizer:tap4];
    UIView *view41 = [[UIView alloc]init];
    [view4 addSubview:view41];
    [view41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.equalTo(view4.mas_height).multipliedBy(.5);
    }];
    //view41.backgroundColor = [UIColor redColor];
    UIImageView *imageView40 = [[UIImageView alloc]init];
    [view41 addSubview:imageView40];
    [imageView40 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerY.equalTo(view41.mas_centerY);
    }];
    imageView40.backgroundColor = [UIColor blueColor];
    imageView40.layer.cornerRadius = 25;
    imageView40.layer.masksToBounds = YES;
    UILabel *label41 = [[UILabel alloc]init];
    [view41 addSubview:label41];
    [label41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView40.mas_right).offset(3);
        make.centerY.equalTo(view41.mas_centerY).offset(-15);
    }];
    label41.text = @"CBD家具";
    label41.textColor = [UIColor blackColor];
    label41.font = kFontSize(15);
    
    UILabel *label42 = [[UILabel alloc]init];
    [view41 addSubview:label42];
    [label42 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView40.mas_right).offset(3);
        make.centerY.equalTo(view41.mas_centerY).offset(15);
    }];
    label42.text = @"在线销售918";
    label42.textColor = kStringColor;
    label42.font = kFontSize(12);
    
    UILabel *label43 = [[UILabel alloc]init];
    [view41 addSubview:label43];
    [label43 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.centerY.equalTo(view41.mas_centerY);
    }];
    label43.text = @"进店 >";
    label43.textColor = kPickColor;
    label43.font = kFontSize(15);
    
    
    UIView *view42 = [[UIView alloc]init];
    [view4 addSubview:view42];
    [view42 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.equalTo(view4.mas_height).multipliedBy(.5);
    }];
    UIImageView *imageView42 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"renzheng"]];
    [view42 addSubview:imageView42];
    [imageView42 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

    return self;
}

// 会员
- (void)pushMemberAction
{
    if ([self.delegate respondsToSelector:@selector(view0WithMemberClick)]){
        [self.delegate view0WithMemberClick];
    }
}

// 优惠券
- (void)pushDiscountView
{
    if ([self.delegate respondsToSelector:@selector(view0WithDiscountClick)]){
        [self.delegate view0WithDiscountClick];
    }
}

// 进店
- (void)pushShopView
{
    if ([self.delegate respondsToSelector:@selector(view0WithShopClick)]){
        [self.delegate view0WithShopClick];
    }
}
#pragma mark scrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
{
    if ([self.delegate respondsToSelector:@selector(view0WithBannerClick:)]){
        [self.delegate view0WithBannerClick:index];
    }
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
