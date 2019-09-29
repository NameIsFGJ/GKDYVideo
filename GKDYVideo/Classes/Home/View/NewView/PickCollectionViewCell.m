//
//  PickCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "PickCollectionViewCell.h"
#import "MarketModel.h"
@implementation PickCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(HotGoodsModel *)model
{
    _model = model;
    
    if ([model.imageheight integerValue] == 260)
    {
        self.imageViewHeightConstraint.constant = 180;
    
    }else if ([model.imageheight integerValue] == 300)
    {
        self.imageViewHeightConstraint.constant = 220;
    }
}

@end
