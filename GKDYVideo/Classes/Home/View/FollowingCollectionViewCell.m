//
//  FollowingCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "FollowingCollectionViewCell.h"
#import "VideoGuanModel.h"

@interface FollowingCollectionViewCell ()
@property (strong, nonatomic)UIView *shadowTopView;
@property (strong, nonatomic)UIView *shadowBottomView;

@end

@implementation FollowingCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
         self.contentView.backgroundColor = kMainColor
        [self.contentView addSubview:self.pictureImageView];
        self.pictureImageView.frame = self.bounds;
        
        [self.pictureImageView addSubview:self.shadowTopView];
        [self.shadowTopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.pictureImageView addSubview:self.shadowBottomView];
        [self.shadowBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.shadowBottomView addSubview:self.nickNameLabel];
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.equalTo(self.shadowBottomView.mas_height).multipliedBy(.5);
        }];
        
        self.nickNameLabel.text = @"啊的阿嘎的";
        
        [self.pictureImageView addSubview:self.isLikeLabel];
        [self.isLikeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nickNameLabel.mas_bottom);
            make.right.mas_equalTo(-10);
        }];
        self.isLikeLabel.text =@"3431";
        [self.pictureImageView addSubview:self.isLikeImageView];
        [self.isLikeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.isLikeLabel.mas_left).offset(-5);
            make.top.equalTo(self.nickNameLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
    }
    return self;
}

- (void)setModel:(VideoModel *)model
{
    _model = model;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,[model valueForKey:@"image"]];
    [self.pictureImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
    self.nickNameLabel.text = [NSString stringWithFormat:@"%@",[model valueForKey:@"name"]];;
    self.isLikeLabel.text = [NSString stringWithFormat:@"%@",[model valueForKey:@"z_count"]];
   // self.nickNameLabel.text = mode
}

- (UIImageView *)pictureImageView
{
    if (!_pictureImageView)
    {
        _pictureImageView = [[UIImageView alloc]init];
        _pictureImageView.backgroundColor = [UIColor whiteColor];
    }
    return _pictureImageView;
}

- (UIView *)shadowTopView
{
    if (!_shadowTopView) {
        _shadowTopView = [[UIView alloc]init];
        _shadowTopView.backgroundColor = [UIColor colorWithHex:@"#C0C0C0" alpha:.7];
    }
    return _shadowTopView;
}

- (UIView *)shadowBottomView
{
    if (!_shadowBottomView) {
        _shadowBottomView = [[UIView alloc]init];
        _shadowBottomView.backgroundColor = [UIColor colorWithHex:@"#C0C0C0" alpha:.7];
    }
    return _shadowBottomView;
}

- (UILabel *)isLikeLabel
{
    if (!_isLikeLabel) {
        _isLikeLabel = [[UILabel alloc]init];
        _isLikeLabel.textColor = [UIColor whiteColor];
        _isLikeLabel.font = kFontSize(12);
    }
    return _isLikeLabel;
}

- (UIImageView *)isLikeImageView
{
    if (!_isLikeImageView) {
        _isLikeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ss_icon_star_normal"]];
    }
    return _isLikeImageView;
}

- (UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.font = kFontSize(12);
        _nickNameLabel.textColor = [UIColor whiteColor];
        _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nickNameLabel;
}


@end
