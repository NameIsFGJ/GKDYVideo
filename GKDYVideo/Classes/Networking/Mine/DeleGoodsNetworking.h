//
//  DeleGoodsNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/11.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeleGoodsNetworking : BaseNetworking
+ (void)postDeleGoodNetworkingWithToken:(NSString *)token
                         withGoodID:(NSInteger)goodID
                         completion:(void(^)(NSInteger code,NSError *error))completionHandle;
@end

NS_ASSUME_NONNULL_END
