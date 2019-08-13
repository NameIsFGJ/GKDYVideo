//
//  MarketHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketHeadView.h"

@interface MarketHeadView()
@property (strong, nonatomic)UIView *bannerView;
@property (strong, nonatomic)UIView *buttonView;
@end

@implementation MarketHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bannerView];
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(212);
        }];
        
        [self addSubview:self.buttonView];
        [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.equalTo(self.bannerView.mas_bottom);
            
        }];
        
    }
    return self;
}

- (UIView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[UIView alloc]init];
        _bannerView.backgroundColor = [UIColor whiteColor];
    }
    return _bannerView;
}

- (UIView *)buttonView
{
    if (!_buttonView) {
        _buttonView = [[UIView alloc]init];
        _buttonView.backgroundColor = [UIColor blueColor];
    }
    return _buttonView;
}
@end
