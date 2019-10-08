//
//  MarketUserShopCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RowsModel;

NS_ASSUME_NONNULL_BEGIN

@interface MarketUserShopCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceName;
@property (strong, nonatomic) RowsModel *model;

@end

NS_ASSUME_NONNULL_END
