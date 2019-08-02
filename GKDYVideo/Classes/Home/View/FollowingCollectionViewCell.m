//
//  FollowingCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/30.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "FollowingCollectionViewCell.h"
#import "VideoGuanModel.h"
@implementation FollowingCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
         self.contentView.backgroundColor = kMainColor
        [self.contentView addSubview:self.pictureImageView];
        self.pictureImageView.frame = self.bounds;
    }
    return self;
}

- (void)setModel:(VideoModel *)model
{
    _model = model;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,[model valueForKey:@"pic_url"]];
    [self.pictureImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
}

- (UIImageView *)pictureImageView
{
    if (!_pictureImageView)
    {
        _pictureImageView = [[UIImageView alloc]init];
    }
    return _pictureImageView;
}
@end
