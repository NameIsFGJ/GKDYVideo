//
//  TopicTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "TopicTableViewCell.h"

@interface TopicTableViewCell ()
@property (strong, nonatomic)UIImageView *iconImageView;
@end

@implementation TopicTableViewCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = kMainColor
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(26, 26));
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        self.iconImageView.image = [UIImage imageNamed:@"jinghao"];
        
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
        self.titleLabel.text = @"二次元服装那里有?";
    }
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

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = kWhiteColor;
        _titleLabel.font = kFontSize(13);
    }
    return _titleLabel;
}

@end
