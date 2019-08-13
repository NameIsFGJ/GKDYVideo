//
//  SetTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "SetTableViewCell.h"

@implementation SetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImageView.layer.cornerRadius = CGRectGetWidth(self.headImageView.frame)/2.0f;
    self.headImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
