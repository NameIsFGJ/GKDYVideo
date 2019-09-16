//
//  ReturnGoodsNetworking.h
//  GKDYVideo
//
//  Created by 冯高杰 on 2019/9/14.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "BaseNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReturnGoodsNetworking : BaseNetworking
+ (void)postApplyRefundWithToken:(NSString *)token
                     withSalerID:(NSInteger)salderID
                     withOrderID:(NSInteger)orderID
                 withRefundPrice:(float)price
                      withReason:(NSString *)reson
                       withNotes:(NSString *)notes
                      completion:(void(^)(NSInteger code,NSError *error))completionHandle;

@end

NS_ASSUME_NONNULL_END

