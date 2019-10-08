//
//  MarketCollectionViewCell.m
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "MarketCollectionViewCell.h"
#import "MarketModel.h"
#import "MarketUserShopModel.h"
@implementation MarketCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.saleCountLabel.hidden = YES;
}

- (void)setModel:(HotGoodsModel *)model
{
    _model = model;
    
    self.saleCountLabel.hidden = YES;
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,model.cover];
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:strUrl]];
    
    self.goodsNameLabel.text = model.name;
    if (model.imageheight == 606)
    {
        self.imageHeight.constant = 160;
//        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.mas_equalTo(17);
//            make.right.mas_equalTo(-17);
//            make.height.mas_equalTo(160);
//        }];
        
    }else if (model.imageheight == 6)
    {
        self.imageHeight.constant = 90;
//        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.mas_equalTo(17);
//            make.right.mas_equalTo(-17);
//            make.height.mas_equalTo(90);
//        }];
    }
    self.goodsPriceLabel.text = model.price;
    
   // self.saleCountLabel.text = [NSString stringWithFormat:@"销售量: %ld",model.sale_count];
}

- (void)setSearchModel:(RowsModel *)searchModel
{
    _searchModel = searchModel;
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",kSERVICE,searchModel.cover];
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:strUrl]];
    
    self.goodsNameLabel.text = searchModel.name;
    if (searchModel.imageheight == 606)
    {
        self.imageHeight.constant = 160;
        //        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //            make.left.top.mas_equalTo(17);
        //            make.right.mas_equalTo(-17);
        //            make.height.mas_equalTo(160);
        //        }];
        
    }else if (searchModel.imageheight == 6)
    {
        self.imageHeight.constant = 90;
        //        [self.goodsImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //            make.left.top.mas_equalTo(17);
        //            make.right.mas_equalTo(-17);
        //            make.height.mas_equalTo(90);
        //        }];
    }
    self.goodsPriceLabel.text = searchModel.price;
    
    self.saleCountLabel.text = [NSString stringWithFormat:@"销售量: %ld",searchModel.sale_count];
}

@end
