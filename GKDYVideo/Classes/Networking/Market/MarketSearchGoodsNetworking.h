//
//  MarketSearchGoodsNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/22.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "MarketUserShopModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketSearchGoodsNetworking : BaseNetworking
+ (void)postSearchGoodsWithKeyword:(NSString *)keyword
                          withPage:(NSInteger)page
                          withSale:(NSInteger)sale
                         withPrice:(NSInteger)price
                       complection:(void(^)(MarketUserShopModel *model,NSError *error))complectionHandle;
@end

NS_ASSUME_NONNULL_END
