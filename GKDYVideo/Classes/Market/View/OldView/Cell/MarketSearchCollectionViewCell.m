//
//  MarketSearchCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/20.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketSearchCollectionViewCell.h"

@implementation MarketSearchCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.searchLabel.layer.borderWidth = .5;
    self.searchLabel.layer.cornerRadius = 3;
    self.searchLabel.layer.masksToBounds = YES;
}

@end
