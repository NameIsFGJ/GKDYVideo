//
//  MarkUserShopCollectionHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarkUserShopCollectionHeadView.h"
#import "MarketUserShopModel.h"
@implementation MarkUserShopCollectionHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor colorWithHex:@"#222934"];
    
    
    [self addSubview:self.popButton];
    [self.popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(KStatusBarHeight);
        make.size.mas_equalTo(CGSizeMake(15, 23));
    }];
    
    [self addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(-18);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    self.headImageView.backgroundColor = [UIColor redColor];
    self.headImageView.layer.cornerRadius = 70/2.0f;
    self.headImageView.layer.masksToBounds = YES;
    
    UIView *view0 = [[UIView alloc]init];
    [self addSubview:view0];
    
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headImageView.mas_centerY);
        make.left.equalTo(self.headImageView.mas_right).offset(15);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(55);
    }];
    
    //view0.backgroundColor = [UIColor redColor];
    [view0 addSubview:self.nameLabel];
    [view0 addSubview:self.totalLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(view0.mas_height).multipliedBy(.5);
    }];

    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(view0.mas_height).multipliedBy(.5);
    }];
    self.nameLabel.text = @"依然饭特西的商铺";
    self.totalLabel.text = @"全部商品: 59";
    __weak MarkUserShopCollectionHeadView *weakSelf = self;
    self.getBlock = ^(NSInteger total) {
      weakSelf.totalLabel.text = [NSString stringWithFormat:@"全部商品: %ld",total];
    };
    return self;
}

#pragma mark Action


#pragma mark 懒加载
- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        
    }
    return _headImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = kFontSize(18);
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UILabel *)totalLabel
{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = kFontSize(15);
        _totalLabel.textColor = [UIColor lightGrayColor];
    }
    return _totalLabel;
}

- (UIButton *)popButton
{
    if (!_popButton) {
        _popButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_popButton setImage:[UIImage imageNamed:@"common_white_back"] forState:UIControlStateNormal];
    }
    return _popButton;
}
@end
