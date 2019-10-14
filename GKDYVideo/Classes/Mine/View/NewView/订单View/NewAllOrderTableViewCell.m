//
//  NewAllOrderTableViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "NewAllOrderTableViewCell.h"

@implementation NewAllOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.button1.layer.cornerRadius = 15;
    self.button1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.button1.layer.borderWidth = .3;
    self.button1.layer.masksToBounds = YES;
    
    self.button2.layer.cornerRadius = 15;
    self.button2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.button2.layer.borderWidth = .3;
    self.button2.layer.masksToBounds = YES;
    
    self.button3.layer.cornerRadius = 15;
    self.button3.layer.borderColor = kPickColor.CGColor;
    self.button3.layer.borderWidth = .3;
    self.button3.layer.masksToBounds = YES;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
