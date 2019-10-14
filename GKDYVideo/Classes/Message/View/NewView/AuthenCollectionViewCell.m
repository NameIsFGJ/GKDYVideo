//
//  AuthenCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/12.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "AuthenCollectionViewCell.h"

@implementation AuthenCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headImageView.layer.cornerRadius = 55/2;
    self.headImageView.layer.masksToBounds = YES;
    
}

@end
