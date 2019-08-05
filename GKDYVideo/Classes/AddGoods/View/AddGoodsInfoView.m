//
//  AddGoodsInfoView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/2.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AddGoodsInfoView.h"

@interface AddGoodsInfoView()

@end

@implementation AddGoodsInfoView

- (instancetype)initWithFrame:(CGRect)frame AndWithViewType:(InfoViewType)type;
{
    self = [super initWithFrame:frame];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:lineView];
    [lineView setBackgroundColor: [UIColor colorWithHex:@"#F1F1F1"]];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(.5);
        make.left.mas_equalTo(10);
    }];
    
    if (type == 0) {
        [self addSubview:self.pushButton];
        [self.pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(10);
            make.bottom.top.mas_equalTo(0);
            make.width.mas_equalTo(50);
        }];
        
    }else if (type == 1){
        [self addSubview:self.infoTextField];
        [self.infoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.top.mas_equalTo(0);
            make.width.mas_equalTo(50);
        }];
    }
    
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:kFontSize(15)];
    }
    return _titleLabel;
}

- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton setImage:[UIImage imageNamed:@"pushImage"] forState:UIControlStateNormal];
    }
    return _pushButton;
}

- (UITextField *)infoTextField
{
    if (!_infoTextField) {
        _infoTextField = [[UITextField alloc]init];
        _infoTextField.text = @"233";
        //_infoTextField.placeholder = @"¥0.00";
        _infoTextField.textAlignment = NSTextAlignmentRight;
    }
    return _infoTextField;
}
@end
