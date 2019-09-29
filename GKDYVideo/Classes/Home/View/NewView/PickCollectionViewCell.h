//
//  PickCollectionViewCell.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/26.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotGoodsModel;
NS_ASSUME_NONNULL_BEGIN

@interface PickCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isLikeImageView;
@property (weak, nonatomic) IBOutlet UILabel *likeNumLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;

@property (strong, nonatomic) HotGoodsModel *model;

@end

NS_ASSUME_NONNULL_END
