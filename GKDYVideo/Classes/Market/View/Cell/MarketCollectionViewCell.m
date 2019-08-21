//
//  MarketCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketCollectionViewCell.h"
#import "MarketModel.h"
@implementation MarketCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(HotGoodsModel *)model
{
    _model = model;
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.cover];
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:strUrl]];
    
    self.goodsNameLabel.text = model.name;
    if (model.imageheight == 250)
    {
        self.imageHeight.constant = 160;
//        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.mas_equalTo(17);
//            make.right.mas_equalTo(-17);
//            make.height.mas_equalTo(160);
//        }];
        
    }else if (model.imageheight == 190)
    {
        self.imageHeight.constant = 90;
//        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.mas_equalTo(17);
//            make.right.mas_equalTo(-17);
//            make.height.mas_equalTo(90);
//        }];
    }
    self.goodsPriceLabel.text = model.price;
}

@end
