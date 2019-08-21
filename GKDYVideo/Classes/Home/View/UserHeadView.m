//
//  UserHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserHeadView.h"

@implementation UserHeadView

- (instancetype)init
{
    self = [super init];
    
    [self addSubview:self.headPicImageView];
    [self.headPicImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.headPicImageView.layer.cornerRadius = 50.0f;
    self.headPicImageView.layer.masksToBounds = YES;
    self.headPicImageView.backgroundColor = [UIColor whiteColor];
    UIView *contentView = [[UIView alloc]init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(self.headPicImageView.mas_right).offset(10);
        make.right.mas_equalTo(-12);
        make.bottom.equalTo(self.headPicImageView.mas_bottom).offset(0);
    }];
    
    [contentView addSubview:self.nickNameLabel];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
    }];
    self.nickNameLabel.text = @"依然范特西";
    
    [contentView addSubview:self.sexImageView];
    [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLabel.mas_top);
        make.left.equalTo(self.nickNameLabel.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    self.sexImageView.image = [UIImage imageNamed:@"nan"];
    
    [contentView addSubview:self.guanButton];
    [self.guanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLabel.mas_top);
        make.left.equalTo(self.sexImageView.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(64, 22));
    }];
    
    [contentView addSubview:self.mfNumLabel];
    [self.mfNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLabel.mas_bottom).offset(13);
        make.left.equalTo(self.nickNameLabel.mas_left);
    }];
    self.mfNumLabel.text = @"漫饭号:223525151";
    
    [contentView addSubview:self.cityButton];
    [self.cityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mfNumLabel.mas_top).offset(0);
        make.left.equalTo(self.mfNumLabel.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 12));
    }];
    
    [contentView addSubview:self.shopButton];
    [self.shopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mfNumLabel.mas_bottom).offset(13);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(105, 30));
    }];
    
    [contentView addSubview:self.messageButton];
    [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shopButton.mas_top);
        make.left.equalTo(self.shopButton.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(105, 30));
    }];
    
    [self addSubview:self.signsLabel];
    [self.signsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headPicImageView.mas_bottom).offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    self.signsLabel.text = @"打发我那卡可分为机械的是肌肤降温,分为机械的是肌肤降温分为机械的是肌肤降温分为机械的是肌肤降温.分为机械的是肌肤降温分为机械的是肌肤降温.";
    
    [self addSubview:self.zanNumberLabel];
    [self.zanNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self.signsLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 16));
    }];
    self.zanNumberLabel.text = @"10W获赞";
  
    [self addSubview:self.guanNumberLabel];
    [self.guanNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.zanNumberLabel.mas_right).offset(20);
        make.top.equalTo(self.signsLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    self.guanNumberLabel.text = @"10W获赞";
    
    [self addSubview:self.fansNumberLabel];
    [self.fansNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.guanNumberLabel.mas_right).offset(20);
        make.top.equalTo(self.signsLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    self.fansNumberLabel.text = @"10W获赞";
    
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.height.mas_equalTo(.5);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    
    
    return self;
}
#pragma mark Action
//  关注
- (void)followingButtonAction
{
    if ([self.delegate respondsToSelector:@selector(controlViewDidFollowing:)]) {
        [self.delegate controlViewDidFollowing:self];
    }
}

// TA 的商铺
- (void)pushShopViewController
{
    if ([self.delegate respondsToSelector:@selector(controlViewDidTAShop:)]) {
        [self.delegate controlViewDidTAShop:self];
    }
}

//  私信
- (void)pushMessageViewController
{
    if ([self.delegate respondsToSelector:@selector(controlViewDidMessage:)]) {
        [self.delegate controlViewDidTAShop:self];
    }
}

#pragma mark 懒加载
- (UIImageView *)headPicImageView
{
    if (!_headPicImageView) {
        _headPicImageView = [[UIImageView alloc]init];
    }
    return _headPicImageView;
}

- (UIButton *)guanButton
{
    if (!_guanButton) {
        _guanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_guanButton setTitle:@"+ 关注" forState:UIControlStateNormal];
        [_guanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[_guanButton setImage:[UIImage imageNamed:@"jiahao"] forState:UIControlStateNormal];
        //_guanButton.imageEdgeInsets = UIEdgeInsetsMake(-3, 3, -3, 3);
        [_guanButton.titleLabel setFont:kFontSize(13)];
        [_guanButton setBackgroundColor:[UIColor redColor]];
        _guanButton.layer.cornerRadius = 5;
        _guanButton.layer.masksToBounds = YES;
        [_guanButton addTarget:self action:@selector(followingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _guanButton;
}

- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.textColor = [UIColor whiteColor];
        _nickNameLabel.font = kFontSize(18);
    }
    return _nickNameLabel;
}

- (UILabel *)mfNumLabel
{
    if (!_mfNumLabel) {
        _mfNumLabel = [[UILabel alloc]init];
        _mfNumLabel.font = kFontSize(12);
        _mfNumLabel.textColor = [UIColor whiteColor];
        
    }
    return _mfNumLabel;
}

- (UIImageView *)sexImageView
{
    if (!_sexImageView) {
        _sexImageView = [[UIImageView alloc]init];
    }
    return _sexImageView;
}

- (UIButton *)cityButton
{
    if (!_cityButton) {
        _cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cityButton setTitle:@"杭州" forState:UIControlStateNormal];
        [_cityButton setImage:[UIImage imageNamed:@"dingwei"] forState:UIControlStateNormal];
        [_cityButton.titleLabel adjustsFontSizeToFitWidth];
        _cityButton.titleLabel.font = kFontSize(12);
        _cityButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return _cityButton;
}

- (UIButton *)shopButton
{
    if (!_shopButton) {
        _shopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shopButton setImage:[UIImage imageNamed:@"shopImage"] forState:UIControlStateNormal];
        [_shopButton addTarget:self action:@selector(pushShopViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shopButton;
}

- (UIButton *)messageButton
{
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageButton setImage:[UIImage imageNamed:@"messImage"] forState:UIControlStateNormal];
        [_messageButton addTarget:self action:@selector(pushMessageViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageButton;
}

- (UILabel *)signsLabel
{
    if (!_signsLabel) {
        _signsLabel = [[UILabel alloc]init];
        _signsLabel.textColor = [UIColor whiteColor];
        _signsLabel.font = kFontSize(12);
        _signsLabel.numberOfLines = 2;
    }
    return _signsLabel;
}

- (UILabel *)zanNumberLabel
{
    if (!_zanNumberLabel) {
        _zanNumberLabel = [[UILabel alloc]init];
        _zanNumberLabel.textColor =[UIColor whiteColor];
        _zanNumberLabel.font = kFontSize(16);
    }
    return _zanNumberLabel;
}

- (UILabel *)guanNumberLabel
{
    if (!_guanNumberLabel) {
        _guanNumberLabel = [[UILabel alloc]init];
        _guanNumberLabel.textColor =[UIColor whiteColor];
        _guanNumberLabel.font = kFontSize(16);
    }
    return _guanNumberLabel;
}

- (UILabel *)fansNumberLabel
{
    if (!_fansNumberLabel) {
        _fansNumberLabel = [[UILabel alloc]init];
        _fansNumberLabel.textColor =[UIColor whiteColor];
        _fansNumberLabel.font = kFontSize(16);
    }
    return _fansNumberLabel;
}



@end
