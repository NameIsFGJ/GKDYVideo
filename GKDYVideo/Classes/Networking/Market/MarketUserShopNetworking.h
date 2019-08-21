//
//  MarketUserShopNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/21.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "MarketUserShopModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarketUserShopNetworking : BaseNetworking

+ (void)postUserShopWithUsrID:(NSInteger)userID
                     withPage:(NSInteger)page
                   completion:(void(^)(MarketUserShopModel *model,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END
