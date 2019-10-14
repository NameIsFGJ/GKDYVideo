//
//  MessageTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/5.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // 头像圆角
    self.head_pic.layer.cornerRadius = 40/2.0f;
    self.head_pic.layer.masksToBounds = YES;
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
