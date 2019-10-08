//
//  MarkCollectionHeadView.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MarketModel;
NS_ASSUME_NONNULL_BEGIN
typedef void(^PushuIndexBlock)(NSInteger index);

typedef void(^GetModelBlock)(MarketModel *model);


@interface MarkCollectionHeadView : UICollectionReusableView

@property (strong, nonatomic)SDCycleScrollView *scrollView;
@property (strong, nonatomic)NSMutableArray *itemsArray;
@property (copy, nonatomic)PushuIndexBlock block;
@property (strong, nonatomic) MarketModel *model;
@property (copy, nonatomic)GetModelBlock getBlock;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
