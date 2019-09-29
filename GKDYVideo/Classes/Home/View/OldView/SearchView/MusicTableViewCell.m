//
//  MusicTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MusicTableViewCell.h"

@implementation MusicTableViewCell

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
    
    self.contentView.backgroundColor = kMainColor
      self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    self.iconImageView.image = [UIImage imageNamed:@"userIcon"];
    
    [self.contentView addSubview:self.musicNameLabel];
    [self.musicNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-13);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
    }];
    self.musicNameLabel.text = @"时间煮雨";
    
    [self.contentView addSubview:self.musicTimeLabel];
    [self.musicTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(12);
        make.left.mas_equalTo(self.musicNameLabel);
    }];
    self.musicTimeLabel.text = @"5.1W 人使用";
    
    [self.contentView addSubview:self.playButton];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(75, 25));
        make.centerY.mas_equalTo(self.contentView);
    }];
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView)
    {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 5;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)musicNameLabel
{
    if (!_musicNameLabel)
    {
        _musicNameLabel = [[UILabel alloc]init];
        _musicNameLabel.font = kFontSize(18);
        [_musicNameLabel setTextColor:kWhiteColor];
    }
    return _musicNameLabel;
}

- (UILabel *)musicTimeLabel
{
    if (!_musicTimeLabel)
    {
        _musicTimeLabel = [[UILabel alloc]init];
        _musicTimeLabel.font = kFontSize(15);
        [_musicTimeLabel setTextColor:kWhiteColor];
    }
    return _musicTimeLabel;
}

- (UIButton *)playButton
{
    if (!_playButton)
    {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setBackgroundColor:[UIColor redColor]];
        [_playButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_playButton setTitle:@"拍同款" forState:UIControlStateNormal];
        _playButton.layer.cornerRadius = 3;
        _playButton.layer.masksToBounds = YES;
        [_playButton setBackgroundColor:[UIColor colorWithHex:@"#E5438D"]];
    }
    return _playButton;
}

@end
