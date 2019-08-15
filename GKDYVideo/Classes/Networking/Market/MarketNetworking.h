//
//  MarketNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/8/13.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"
#import "MarketModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketNetworking : BaseNetworking
+(void)postIndexWithCompletion:(void(^)(MarketModel *model,NSError *error))completionHanle;
@end

NS_ASSUME_NONNULL_END
