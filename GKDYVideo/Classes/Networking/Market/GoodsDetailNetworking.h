//
//  GoodsDetailNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/6.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsDetailNetworking : BaseNetworking

+ (void)postGoodsDetailWithGoodsID:(NSInteger)goodsID completion:(void(^)(NSDictionary *dic,NSError *error))completionHandler;

@end

NS_ASSUME_NONNULL_END
