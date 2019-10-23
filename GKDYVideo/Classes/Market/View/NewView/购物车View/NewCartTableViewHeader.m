//
//  NewCartTableViewHeader.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewCartTableViewHeader.h"

@implementation NewCartTableViewHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    [self.contentView addSubview:self.clickButton];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.contentView addSubview:self.shopImageView];
    [self.shopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.clickButton.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.contentView addSubview:self.shopNameLabel];
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.shopImageView.mas_right).offset(5);
    }];
        
    }
    
    return self;
}


- (void)clickButtonAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        
    }
    
    if (self.clickSection) {
        self.clickSection(sender.selected);
    }
}

- (void)setModel:(NewMarketShopCartModel *)model
{
    _model = model;
    self.shopNameLabel.text = model.shopName;
    self.isClick = model.isSelect;
}

- (void)setIsClick:(BOOL)isClick
{
    _isClick = isClick;
    
    self.clickButton.selected = isClick;
    if (isClick) {
        [self.clickButton setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
    }else{
        [self.clickButton setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        
    }
}
#pragma mark lazyLoad
- (UIButton *)clickButton
{
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickButton setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        [_clickButton addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

- (UIImageView *)shopImageView
{
    if (!_shopImageView) {
        _shopImageView = [[UIImageView alloc]init];
        _shopImageView.backgroundColor = [UIColor blueColor];
    }
    return _shopImageView;
}

- (UILabel *)shopNameLabel
{
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc]init];
        _shopNameLabel.textColor = [UIColor blackColor];
        _shopNameLabel.font = [UIFont systemFontOfSize:15];
        _shopNameLabel.text = @"李宁专卖店";
    }
    return _shopNameLabel;
}

@end
