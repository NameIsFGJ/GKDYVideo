//
//  MarketCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotGoodsModel;
NS_ASSUME_NONNULL_BEGIN

@interface MarketCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (strong, nonatomic)HotGoodsModel *model;




@end

NS_ASSUME_NONNULL_END
