//
//  AddNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/10.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddNetworking : BaseNetworking
+ (void)postAddWithToken:(NSString *)token
             withGoodsID:(NSInteger)goodsID
             withSalerID:(NSInteger)salerID
           withAddressID:(NSInteger)addressID
         withOrderAmount:(float)orderAmount
          withGoodsPrice:(float)goodsPrice
            withGoodsNum:(NSInteger)goodsNum
              completion:(void(^)(NSDictionary *dataDic,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END
