//
//  MyFriendTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MyFriendTableViewCell.h"

@implementation MyFriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.head_pic.layer.cornerRadius = self.head_pic.frame.size.width/2.0f;
    self.head_pic.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
