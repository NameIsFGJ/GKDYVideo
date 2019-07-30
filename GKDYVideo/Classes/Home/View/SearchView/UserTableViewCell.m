//
//  UserTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithHex:@"#222934"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        self.iconImageView.image = [UIImage imageNamed:@"userIcon"];
        
        [self.contentView addSubview:self.userNameLabel];
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(12);
            make.centerY.mas_equalTo(self.contentView);
        }];
         self.userNameLabel.text = @"漫饭一号";
        [self.contentView addSubview:self.userSexImageView];
        [self.userSexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userNameLabel.mas_right).offset(12);
            make.centerY.mas_equalTo(self.contentView);
        }];
        self.userSexImageView.image = [UIImage imageNamed:@"nan"];
        
        [self.contentView addSubview:self.followingButton];
        [self.followingButton mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerY.mas_equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-10);
            make.size.mas_equalTo(CGSizeMake(75, 25));
             make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 25;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel)
    {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = kFontSize(18);
        [_userNameLabel setTextColor:[UIColor whiteColor]];
    }
    return _userNameLabel;
}

- (UIImageView *)userSexImageView
{
    if (!_userSexImageView)
    {
        _userSexImageView = [[UIImageView alloc]init];
    }
    return _userSexImageView;
}

- (UIButton *)followingButton
{
    if (!_followingButton)
    {
        _followingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_followingButton setBackgroundColor:[UIColor redColor]];
        [_followingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_followingButton setTitle:@"关注" forState:UIControlStateNormal];
        _followingButton.layer.cornerRadius = 3;
        _followingButton.layer.masksToBounds = YES;
    }
    return _followingButton;
}

@end
