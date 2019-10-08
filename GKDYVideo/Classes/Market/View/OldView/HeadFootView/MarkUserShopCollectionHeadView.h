//
//  MarkUserShopCollectionHeadView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GetModelBlock)(NSInteger total);

@interface MarkUserShopCollectionHeadView : UICollectionReusableView
@property (strong, nonatomic)UIButton *popButton;
@property (strong, nonatomic)UIImageView *headImageView;
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UILabel *totalLabel;
@property (copy, nonatomic)GetModelBlock getBlock;

@end

NS_ASSUME_NONNULL_END
