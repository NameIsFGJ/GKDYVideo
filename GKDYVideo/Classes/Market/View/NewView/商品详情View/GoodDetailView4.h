//
//  GoodDetailView4.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/10/24.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GoodDetailView4Delegate <NSObject>

- (void)view4WithShopClick:(NSInteger)shopID;
- (void)view4WithService;
- (void)view4WithShopCart;
- (void)view4WithAddCartClick:(NSInteger)goodID;
- (void)view4WithBuyClick:(NSInteger)goodID;

@end
@interface GoodDetailView4 : UIView

@property (nonatomic, weak) id<GoodDetailView4Delegate> delegate;

@end

NS_ASSUME_NONNULL_END
