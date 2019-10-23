//
//  NewCartBottomView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewCartBottomView.h"

@implementation NewCartBottomView

- (instancetype)init
{
    self = [super init];
    
    [self addSubview:self.clickButton];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    
    [self addSubview:self.label0];
    [self.label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.clickButton.mas_right).offset(10);
    }];
    
    [self addSubview:self.accountButton];
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [self addSubview:self.deleteGoodsButton];
    [self.deleteGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [self addSubview:self.totalPriceLabel];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.accountButton.mas_left).offset(-10);
        
    }];
    
    [self addSubview:self.label1];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.totalPriceLabel.mas_left).offset(-10);
        
    }];
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
    
    self.clickBlock(sender.selected);
    
}

- (void)accountButtonAction
{
    NSLog(@"结算");
    if (self.totalBlock) {
        self.totalBlock();
    }
}

- (void)deleteButtonAction
{
    NSLog(@"删除");
    if (self.deleteBlock) {
        self.deleteBlock();
    }
}

- (void)setIsClick:(BOOL)isClick
{
    _isClick = isClick;
    if (isClick)
    {
        [self.clickButton setImage:[UIImage imageNamed:@"reasonSelected"] forState:UIControlStateNormal];
        
        NSLog(@"全选状态");
        
    }else
    {
        [self.clickButton setImage:[UIImage imageNamed:@"reasonNormal"] forState:UIControlStateNormal];
        
      NSLog(@"没有全选状态");
        
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

- (UILabel *)label0
{
    if (!_label0) {
        _label0 = [[UILabel alloc]init];
        _label0.textColor = [UIColor blackColor];
        _label0.font = [UIFont systemFontOfSize:15];
        _label0.text = @"全选";
    }
    return _label0;
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [[UILabel alloc]init];
        _label1.textColor = [UIColor blackColor];
        _label1.font = [UIFont systemFontOfSize:15];
        _label1.text = @"合计";
    }
    return _label1;
}

- (UILabel *)totalPriceLabel
{
    if (!_totalPriceLabel) {
        _totalPriceLabel = [[UILabel alloc]init];
        _totalPriceLabel.textColor = [UIColor blackColor];
        _totalPriceLabel.font = [UIFont systemFontOfSize:15];
        _totalPriceLabel.text = @"00.00";
    }
    return _totalPriceLabel;
}

- (UIButton *)accountButton
{
    if (!_accountButton) {
        _accountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_accountButton setTitle:@"结算" forState:UIControlStateNormal];
        [_accountButton setBackgroundColor:kPickColor];
        [_accountButton addTarget:self action:@selector(accountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountButton;
}

- (UIButton *)deleteGoodsButton
{
    if (!_deleteGoodsButton) {
        _deleteGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteGoodsButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteGoodsButton setBackgroundColor:kPickColor];
        [_deleteGoodsButton addTarget:self action:@selector(deleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _deleteGoodsButton.hidden = YES;
    }
    return _deleteGoodsButton;
}


@end
