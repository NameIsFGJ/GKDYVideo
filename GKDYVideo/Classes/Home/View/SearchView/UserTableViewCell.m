//
//  UserTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "UserTableViewCell.h"
#import "SearchUserModel.h"
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
        self.contentView.backgroundColor = kMainColor
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

- (void)setModel:(SearchUserData *)model
{
    _model = model;
    
    // 头像
    NSString *headUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.head_pic];
    NSLog(@"headUrl  =%@",headUrl);
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:headUrl]];
    
    // 名称
    self.userNameLabel.text = model.nickname;
    
    // 性别
    
    self.userSexImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.sex ? @"nan": @"nv"]];
    
    // 关注
     // 已关注
    if (model.is_guan == 1)
    {
        [self.followingButton setTitle:@"已关注" forState:UIControlStateNormal];
        [self.followingButton setBackgroundColor:[UIColor lightGrayColor]];
        self.followingButton.enabled = YES;
    }else if (model.is_guan == 0){
        [self.followingButton setTitle:@"关注" forState:UIControlStateNormal];
        [self.followingButton setBackgroundColor:[UIColor redColor]];
        self.followingButton.enabled = NO;
    }
}


#pragma mark 懒加载
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
        [_userNameLabel setTextColor:kWhiteColor];
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
        [_followingButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_followingButton setTitle:@"关注" forState:UIControlStateNormal];
        _followingButton.layer.cornerRadius = 3;
        _followingButton.layer.masksToBounds = YES;
    }
    return _followingButton;
}

@end
