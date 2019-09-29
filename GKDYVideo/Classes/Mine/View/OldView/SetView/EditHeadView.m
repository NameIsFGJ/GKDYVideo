//
//  EditHeadView.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/7.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "EditHeadView.h"

@implementation EditHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UIView *contentView = [[UIView alloc]init];
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(140);
        }];
        
        self.headPicImageView = [[UIImageView alloc]init];
        [contentView addSubview:self.headPicImageView];
        [self.headPicImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 90));
            make.center.equalTo(contentView).offset(0);
        }];
        self.headPicImageView.image = [UIImage imageNamed:@"userIcon"];
        self.headPicImageView.layer.cornerRadius = 90/2.0f;
        self.headPicImageView.layer.masksToBounds = YES;
        self.headPicImageView.userInteractionEnabled = YES;
        self.changeIconBlackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.headPicImageView addSubview: self.changeIconBlackButton];
        
        [self.changeIconBlackButton setImage:[UIImage imageNamed:@"editImage"] forState:UIControlStateNormal];
        self.changeIconBlackButton.imageView.contentMode = UIViewContentModeCenter;
        [ self.changeIconBlackButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        self.changeIconBlackButton.backgroundColor = [UIColor colorWithHex:@"#000000" alpha:.5];
        self.changeIconBlackButton.userInteractionEnabled = YES;
        
        self.changeIconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.changeIconButton];
        [self.changeIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(110, 15));
            make.top.equalTo(contentView.mas_bottom).offset(0);
            make.centerX.mas_equalTo(0);
            //make.left.mas_equalTo(100);
        }];
        
        [self.changeIconButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.changeIconButton setTitle:@"点击更换头像" forState:UIControlStateNormal];
        [self.changeIconButton.titleLabel setFont:kFontSize(15)];
        [self.changeIconButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
        
    }
    return self;
}
@end
