//
//  OrderDetilNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/19.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetilNetworking : BaseNetworking
+(void)postOrderDetailNetworkingWithToken:(NSString *)token
                             withType:(NSInteger)type
                          withOrderID:(NSInteger)orderID
                           completion:(void(^)(NSMutableArray *array,NSError *error))completionHanlde;

@end

NS_ASSUME_NONNULL_END
