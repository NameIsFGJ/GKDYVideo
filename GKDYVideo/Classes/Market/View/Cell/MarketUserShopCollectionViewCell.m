//
//  MarketUserShopCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketUserShopCollectionViewCell.h"
#import "MarketUserShopModel.h"
@implementation MarketUserShopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(RowsModel *)model
{
    // 图片
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kSERVICE,model.cover];
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
    // 标题
    self.nameLabel.text = model.name;
    
    // 价格
    self.priceName.text = model.price;
}

@end
