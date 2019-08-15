//
//  VideoCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/7/29.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import "SearchVideoModel.h"
@implementation VideoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.videoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image1"]];
        self.videoImageView.frame = self.contentView.bounds;
        [self.contentView addSubview:self.videoImageView];
    }
    return self;
}

- (void)setModel:(SearchVideoModel *)model
{
    _model = model;
    
    NSString *imageUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.image];
    NSLog(@"ima333ge =%@",model.image);
   // [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"image1"]];
}

@end
